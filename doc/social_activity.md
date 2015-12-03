# Social Activity
Each activity has a:
* Target (where the activity belongs to, e.g. "Slot" if someone likes the slot)
* Action (the action of the activity, e.g. "comment" or "like")
* Object (the activity objects model name, e.g. "Comment" or "Like")

The most activities are also connected to an user (isn't required at all), called as:
* Actor (the user who makes the activity)
* Foreign (the relationship target who belongs to the activity target, e.g. "Creator")

These 5 basic relations are the "meta data" of each activity.

## Re-Build: Topics, Follower, Followings, Activities, Feeds

Since we are using live aggregation we are able to change logic on the fly. Whenever we have to make changes in the logic of redis feed data we have a build script which can re-build all data with actual logic.

Type in console:

```bash
rake feed:build RAILS_ENV=development
```

For Heroku:

```bash
heroku run rake feed:build -a {APP_NAME}
```

This will perform the following steps:

1. Flush all redis data
2. Re-Build: Topics, Follower, Followings
3. Re-Build: Activities, Feeds

##### Some redis commands for the rails console:

```bash
$> $redis.keys     # list redis keys
$> $redis.info     # show redis info
$> $redis.flushall # fush redis data
```

## Activity Topic Model

Each target has its own topic channel which a follower can subscribe to. This will often happens automatically, e.g.: if an user reslot a slot, the user also follows this slot. With a follow model we can handle the activity messages outside of the membership relation.


![Activity Topic Model](topic_model.png)


The same topic model is used for subscribing to a stream channel.

### Think depending to the activity target
To better understand the basic concept of activity model abstraction always keep a "target context" in mind, like:
* SlotActivity is an activity where the target belongs to a slot (e.g. "like")
* GroupActivity is an activity where the target belongs to a group (e.g. through "membership")
* UserActivity is an activity where the target belongs to a user (e.g. through "friendship")

The same context should be valid on: feeds, topics, followers, followings (except channels).


## Activity Distribution Model

The "Activity Dispatcher" distribute the activities to the feeds and channels as a background process through an asynchronous worker thread.


![Activity Distribution Model](activity_distribution.png)


#### Distribution Strategy: Read-Opt vs. Write-Opt
Read-Opt: Activities will be delegated to each users feed.
Write-Opt: Stores all activities as unique to the target feed.

Actual we are using the *Write-Read-Opt*-Strategy. Each activity will be stored respectively to its target feed index (unique). Furthermore activities will be dispatched through social relations and stores a "pointer" to the target feed index.

A = Actors (Write)

F = Followers (Read)

| | Read-Opt | Write-Opt | Write-Read-Opt (Bridge) |
|----|----|----|----|
| Read Access: | F | F * (A + F) | A + F + 1 |
| Validations: | F | ALL | F + 1 |
| Write Access: | A * (A + F) | A | A * (A + F) + 1 |
| Capacity: | A * (A + F) | A | A + 1 |

#### 1. Example
3 users do an activity + 25 followers get a notification and makes a request to this activity (500.000 Activities already exist through relations of all 28 users)

| | Read-Opt | Write-Opt | Write-Read-Opt (Bridge) |
|----|----|----|----|
| Read Access: | 25 | 700 | 29 |
| Validations: | 25 | 500.025 | 26 |
| Write Access: | 84 | 3 | 85 |
| Capacity: | 84 | 3 | 4 |

#### 2. Example
25 users do an activity + 3 followers get a notification and makes a request to this activity (500.000 Activities already exist through relations of all 28 users)

| | Read-Opt | Write-Opt | Write-Read-Opt (Bridge) |
|----|----|----|----|
| Read Access: | 3 | 84 | 29 |
| Validations: | 3 | 500.003 | 4 |
| Write Access: | 700 | 25 | 701 |
| Capacity: | 700 | 25 | 26 |

#### NOTE
"Write-Opt" also has the effect, that all activities will be determine on each new request, there is no extra "activity-snapshot". If a user follows a slot, the user will automatically get all old activities which are stored to this target feed. If the user unfollow the slot, all activities from this slot are also removed. Furthermore the pagination on Write-Opt-Targetings is very ineffective, the whole data has to be fetched and has to be sorted by date (to determine the current/next page) as well as the visibility and policy has to be validated on full data on each request. These are good reasons for why we do not use aggressive Write-Opt-Strategy.

## Live Aggregation
In handy to make changes on the aggregation logic we are currently no storing aggregation logic into the feed data to save backward compatibility. The feed data includes the default basic data of an activity as an abstraction of it and can be reproduced ("enriched") anytime.

## Activity Feed Schema

There is no logic inside the code which can affect the message. This guarantees that each message is translatable to each language. Instead we enrich the message text "on the fly" during the aggregation process.


![Activity Feed Schema](activity_feed_schema.png)


## Multi-lingual Message Composing

![Multi-lingual Message Composing](message_composing.png)

## Activity Feed Dispatcher (Read/Write-Opt)

![Activity Feed Dispatcher](feed_dispatcher.png)


