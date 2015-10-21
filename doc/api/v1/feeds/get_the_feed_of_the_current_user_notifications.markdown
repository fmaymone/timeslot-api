# Feeds API

## Get the feed of the current user notifications

### GET /v1/feed/notification

### Parameters

Name : limit
Description : Maximum count of items which are included in the result

Name : offset
Description : The offset value how many result items should be skipped before the limits start counting (or use cursor instead)

Name : cursor
Description : The ID of the activity to start loading from (not included) (or use offset instead)


### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : openEnd
Description : OpenEnd Boolean Flag

Name : createdAt
Description : Creation of slot

Name : updatedAt
Description : Last update of slot

Name : deletedAt
Description : Delete date of slot or nil

Name : location
Description : Location data for the slot

Name : creator
Description : User who created the slot

Name : settings
Description : Only included if it&#39;s a slot of the current User (created-/friend-/re-/groupslot),

contains User specific settings for this slot (alerts)

Name : visibility
Description : Visibiltiy of the slot

Name : notes
Description : Notes on the slot

Name : likes
Description : Likes for the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : reslotsCounter
Description : Number of reslots for this slot

Name : shareUrl
Description : Share URL for this slot, nil if not yet shared

Name : images
Description : Images for the slot

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos recordings for the slot

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : push
Description : Send push Notifications (true/false)

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : slotCount
Description : Number of slots for this user

Name : reslotCount
Description : Number of reslots for this user

Name : friendsCount
Description : Number of friends for this user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=S-yK6HftvyGXobHBfMsd6jasjDE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/notification</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/notification&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=S-yK6HftvyGXobHBfMsd6jasjDE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6e9baa4a44f0d5fa8a92a613c9354694&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c4b8887f-7f45-47f7-ae35-93dd6ba7189d
X-Runtime: 0.012994
Vary: Origin
Content-Length: 230</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "actor" : "8",
    "object" : 3,
    "target" : "3",
    "activity" : "comment",
    "message" : "User 53 commented on your Slot: Slot title 23",
    "foreignId" : "9",
    "time" : "2015-10-21T11:48:07.910Z",
    "id" : "E65E488655670E19C0EB36F5EF8D332629782763"
  }
]
```
