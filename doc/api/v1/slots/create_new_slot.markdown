# Slots API

## Create new slot

### POST /v1/slots

Creates new slot for user and adds it to the users &#39;MyCalendar&#39; and to all slotGroups which were given additionally.

Returns data of new slot and array with unauthorized slotgroup UUIDs (User has no write access or slotgroup deleted).

Returns 422 if parameters are invalid or missing.

### Parameters

Name : title *- required -*
Description : Title of slot (max. 60 characters)

Name : startDate *- required -*
Description : Startdate and Time of the Slot

Name : endDate *- required -*
Description : Enddate and Time of the Slot (startdate + duration).

Name : location
Description : Location associated with this slot (see example)

Name : media
Description : Media items (image/audio/video) of to the Slot (see example)

Name : notes
Description : Notes for to the Slot (see example)

Name : settings
Description : User specific settings for the slot (alerts)

Name : alerts
Description : Alerts for the Slot

Name : visibility *- required -*
Description : Visibility of the Slot (private/friends/foaf/public)

Name : slotGroups
Description : Array with UUIDs of the SlotGroups slot should be added to


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
Description : Visibiltiy of the slot (private/friend/foaf/public)

Name : notes
Description : Notes on the slot

Name : likes
Description : Likes for the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : shareUrl
Description : Share URL for this slot, nil if not yet shared

Name : images
Description : Images for the slot

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos recordings for the slot

Name : reslotsCounter
Description : Number of reslots for this slot

Name : unauthorizedSlotgroups
Description : Array of Slotgroup UUIDs where the current_user has no write access or Slotgroup was deleted. Will be empty if all worked fine.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=8rhAAdCgmXFkXE5ef5OkdOMqYx8
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "endDate" : "2014-09-13T22:03:24.000Z",
  "notes" : [
    {
      "title" : "revolutionizing the calendar",
      "content" : "this is content"
    },
    {
      "title" : "and another title",
      "content" : "more content here"
    }
  ],
  "settings" : {
    "alerts" : "0101010101"
  },
  "visibility" : "private",
  "slotGroups" : [
    "5253b071-9c02-4264-836a-0f739fe2e9ec",
    "b2dc4f14-4c60-4fd3-a93e-23c3a5748fa6",
    "54004683-b2fd-4271-bf25-951ab9f2e9c5",
    "c8200b27-23b5-4b55-bd04-094203c2072d",
    "6679d254-74d3-4cce-a66c-429ab95d07b4"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;visibility&quot;:&quot;private&quot;,&quot;slotGroups&quot;:[&quot;5253b071-9c02-4264-836a-0f739fe2e9ec&quot;,&quot;b2dc4f14-4c60-4fd3-a93e-23c3a5748fa6&quot;,&quot;54004683-b2fd-4271-bf25-951ab9f2e9c5&quot;,&quot;c8200b27-23b5-4b55-bd04-094203c2072d&quot;,&quot;6679d254-74d3-4cce-a66c-429ab95d07b4&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=8rhAAdCgmXFkXE5ef5OkdOMqYx8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;183a10b56eee5e35bae584881f3ba69e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f2ce17d3-5b7d-4352-9c1a-18e1e60459f1
X-Runtime: 0.116526
Vary: Origin
Content-Length: 877</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 1,
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "createdAt" : "2016-03-10T14:31:29.806Z",
  "updatedAt" : "2016-03-10T14:31:29.806Z",
  "deletedAt" : null,
  "endDate" : "2014-09-13T22:03:24.000Z",
  "location" : null,
  "creator" : {
    "id" : 1,
    "username" : "User 278",
    "createdAt" : "2016-03-10T14:31:29.727Z",
    "updatedAt" : "2016-03-10T14:31:29.727Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 1,
    "friendsCount" : 0
  },
  "notes" : [
    {
      "id" : 2,
      "title" : "and another title",
      "content" : "more content here",
      "localId" : null,
      "createdAt" : "2016-03-10T14:31:29.820Z"
    },
    {
      "id" : 1,
      "title" : "revolutionizing the calendar",
      "content" : "this is content",
      "localId" : null,
      "createdAt" : "2016-03-10T14:31:29.816Z"
    }
  ],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "unauthorizedSlotgroups" : [
    "c8200b27-23b5-4b55-bd04-094203c2072d",
    "6679d254-74d3-4cce-a66c-429ab95d07b4"
  ]
}
```
