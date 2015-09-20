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

Name : groupId
Description : ID of the group the slot belongs to

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=Vl9I1uBUvmYI7t-7iTOhoI27BuU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/75/move</pre>

#### Body
```javascript
{
  "slotType" : "friends",
  "details" : "true"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/75/move&quot; -d &#39;{&quot;slotType&quot;:&quot;friends&quot;,&quot;details&quot;:&quot;true&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Vl9I1uBUvmYI7t-7iTOhoI27BuU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f55b785b3357f256ba4e72e1f788878a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3bfbbe89-5587-4f48-b300-cb461b564012
X-Runtime: 0.169380
Vary: Origin
Content-Length: 1472</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 76,
  "title" : "Slot title 61",
  "startDate" : "2019-09-08T13:44:02.000Z",
  "createdAt" : "2015-09-20T18:49:38.475Z",
  "updatedAt" : "2015-09-20T18:49:38.475Z",
  "deletedAt" : null,
  "endDate" : "2019-10-08T13:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 326,
    "username" : "User 290",
    "createdAt" : "2015-09-20T18:49:38.438Z",
    "updatedAt" : "2015-09-20T18:49:38.438Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 70,
      "publicId" : "dfhjghjkdisudgfds7iy60",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-09-20T18:49:38.460Z",
      "duration" : null,
      "title" : "Title 56"
    },
    {
      "mediaId" : 69,
      "publicId" : "dfhjghjkdisudgfds7iy59",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-09-20T18:49:38.457Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 68,
      "publicId" : "dfhjghjkdisudgfds7iy58",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-09-20T18:49:38.455Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 67,
      "publicId" : "dfhjghjkdisudgfds7iy57",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-20T18:49:38.452Z"
    },
    {
      "mediaId" : 66,
      "publicId" : "dfhjghjkdisudgfds7iy56",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-20T18:49:38.449Z"
    },
    {
      "mediaId" : 65,
      "publicId" : "dfhjghjkdisudgfds7iy55",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-20T18:49:38.446Z"
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
