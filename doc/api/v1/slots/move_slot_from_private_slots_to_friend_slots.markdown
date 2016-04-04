# Slots API

## Move Slot from private Slots to Friend Slots

### POST /v1/slots/:id/move

A new slot will be created with  the same Metadata as it&#39;s source. Either slotType or groupId must be provided! If details is set to &#39;true&#39; all media items and notes will be duplicated. The source will be deleted afterwards and with it all comments and likes.

Returns 200 and the data of the new slot.

### Parameters

Name : slotType
Description : Type of slot to move to. Must be own of [private/friends/public]

Name : groupId
Description : Contains the group ID if moving into a group User must be allowed to post to this group

Name : details
Description : Move all media data and notes to the new  slot. Otherwise they will be deleted.

Defaults to &#39;true&#39;, must be one of [true/false]


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

Name : groupId
Description : ID of the group the slot belongs to

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=YveYV5DyAp7pPtm6S8DTx7cA8eM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/35/move</pre>

#### Body
```javascript
{
  "slotType" : "friends",
  "details" : "true"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/35/move&quot; -d &#39;{&quot;slotType&quot;:&quot;friends&quot;,&quot;details&quot;:&quot;true&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=YveYV5DyAp7pPtm6S8DTx7cA8eM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5a884441b2d50a2878bc7962ad46ce65&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 02ff9d9a-5597-4bbb-8ab5-fa05fd43b67c
X-Runtime: 0.051431
Vary: Origin
Content-Length: 476</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 36,
  "title" : "Slot title 99",
  "startDate" : "2019-09-22T06:44:02.000Z",
  "createdAt" : "2016-04-04T20:50:33.311Z",
  "updatedAt" : "2016-04-04T20:50:33.311Z",
  "deletedAt" : null,
  "endDate" : "2019-10-22T06:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 117,
    "username" : "User 419",
    "createdAt" : "2016-04-04T20:50:33.290Z",
    "updatedAt" : "2016-04-04T20:50:33.290Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "friends",
  "likes" : 0,
  "commentsCounter" : 0
}
```
