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
Authorization: Token token=m5kmhUA26Jv9JOoj8v6z3q7ldII
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/34/move</pre>

#### Body
```javascript
{
  "slotType" : "friends",
  "details" : "true"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/34/move&quot; -d &#39;{&quot;slotType&quot;:&quot;friends&quot;,&quot;details&quot;:&quot;true&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=m5kmhUA26Jv9JOoj8v6z3q7ldII&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;06587c5d47a13353b37172df1ac77472&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e2774df7-74db-4e1f-ab0e-5f0676404eb6
X-Runtime: 0.090295
Vary: Origin
Content-Length: 1478</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 35,
  "title" : "Slot title 73",
  "startDate" : "2019-09-24T05:44:02.000Z",
  "createdAt" : "2015-11-17T12:12:41.467Z",
  "updatedAt" : "2015-11-17T12:12:41.467Z",
  "deletedAt" : null,
  "endDate" : "2019-10-24T05:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 97,
    "username" : "User 343",
    "createdAt" : "2015-11-17T12:12:41.435Z",
    "updatedAt" : "2015-11-17T12:12:41.435Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 30,
      "publicId" : "dfhjghjkdisudgfds7iy109",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-11-17T12:12:41.457Z",
      "duration" : null,
      "title" : "Title 105"
    },
    {
      "mediaId" : 29,
      "publicId" : "dfhjghjkdisudgfds7iy108",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T12:12:41.454Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 28,
      "publicId" : "dfhjghjkdisudgfds7iy107",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T12:12:41.452Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 27,
      "publicId" : "dfhjghjkdisudgfds7iy106",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T12:12:41.447Z"
    },
    {
      "mediaId" : 26,
      "publicId" : "dfhjghjkdisudgfds7iy105",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T12:12:41.445Z"
    },
    {
      "mediaId" : 25,
      "publicId" : "dfhjghjkdisudgfds7iy104",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T12:12:41.442Z"
    }
  ],
  "settings" : {
    "alerts" : "0000000000"
  },
  "visibility" : "friends",
  "reslotsCounter" : 0,
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
