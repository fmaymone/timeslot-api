# Social Activity
Each activity has a:
* Target
* Action

The most activities are also connected to an user (isn't required at all), called as:
* Actor

These 3 basic relations are the "meta data" of each activity.

## Think depending to the activity target
To better understand the basic concept of activity model abstraction always keep a "target context" in mind, like:
* SlotActivity is an activity which target is on a slot (e.g. "like")
* GroupActivity is an activity which target is on a group (e.g. "creates a group")
* UserActivity is an activity which target is on a user (e.g. "friendship")

The same context should be valid on: feeds/topics/followings/channels.

## Activity Distribution Model

![Data Flow Chart Concept](activity_distribution.png)

The "Activity Dispatcher" distribute the activities to the feeds and channels as a background process through an asynchronous worker thread.

#### Distribution Strategy: Read-Opt vs. Write-Opt
Actual we are using the *Read-Opt*-Strategy.

|| Read-Opt | Write-Opt |
|----|----|----|
| Read Access: | 1 | N² |
| Write Access: | N | 1 |

##### Example: 3 users do an activity + 25 followers get a notification and makes a request to this activity

|| Read-Opt | Write-Opt |
|----|----|----|
| Read Access: | 25 | 675 |
| Write Access: | 75 | 3 |

#### Redis Performance

Redis is a key-value-storage built for extremely fast write and read access. The data is hold in the memory and should be mapped (or backup) onto a persistent storage. 

| Redis Method | Benchmark |
|----|----|
| PING: | 200803.22 requests per second |
| MSET (10 keys): | 78064.01 requests per second |
| SET: | 198412.69 requests per second |
| GET: | 198019.80 requests per second |
| INCR: | 200400.80 requests per second |
| LPUSH: | 200000.00 requests per second |
| LPOP: | 198019.80 requests per second |
| SADD: | 203665.98 requests per second |
| SPOP: | 200803.22 requests per second |
| LRANGE (first 100 elements): | 42123.00 requests per second |
| LRANGE (first 300 elements): | 15015.02 requests per second |
| LRANGE (first 450 elements): | 10159.50 requests per second |
| LRANGE (first 600 elements): | 7548.31 requests per second |

You can start this benchmark test with:

```bash
$ numactl -C 6 ./redis-benchmark -q -n 100000 -s /tmp/redis.sock -d 256
```

## Live Aggregations
In handy to make changes on the aggregation logic we are currently no storing aggregation logic into the feed data to save backward compatibility. The feed data includes the default basic data of an activity as an abstraction of it and can be reproduced ("enriched") anytime.

## Schema: Activity Feeds & Multi-lingual Message Composing

![Data Flow Chart Concept](activity_feed_concept.png)


There is no logic inside the code which can affect the message. This guarantees that each message is translatable to each language. Instead we enrich the message text "on the fly" during the aggregation process.

## Activity Topic Model

![Data Flow Chart Concept](topic_model.png)


Each target has its own topic channel which a follower can subscribe to. This will often happens automatically, e.g.: if an user reslot a slot, the user also follows this slot. With a follow model we can handle the activity messages outside of the membership relation.

The same topic model is used for subscribing to a stream channel.
