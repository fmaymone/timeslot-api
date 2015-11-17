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
Authorization: Token token=ecRNKIbgL-cq98KGTPVztWhOtj4
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
	-H &quot;Authorization: Token token=ecRNKIbgL-cq98KGTPVztWhOtj4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9c72c7bdea764775ed0d37a4191ee78f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 687f542d-fe4a-439e-b757-93feb72d31f9
X-Runtime: 0.100491
Vary: Origin
Content-Length: 1448</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 35,
  "title" : "Slot title 91",
  "startDate" : "2019-09-15T23:44:02.000Z",
  "createdAt" : "2015-11-17T23:46:16.839Z",
  "updatedAt" : "2015-11-17T23:46:16.839Z",
  "deletedAt" : null,
  "endDate" : "2019-10-15T23:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 95,
    "username" : "User 376",
    "createdAt" : "2015-11-17T23:46:16.805Z",
    "updatedAt" : "2015-11-17T23:46:16.805Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 28,
      "publicId" : "dfhjghjkdisudgfds7iy107",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-11-17T23:46:16.827Z",
      "duration" : null,
      "title" : "Title 105"
    },
    {
      "mediaId" : 27,
      "publicId" : "dfhjghjkdisudgfds7iy106",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T23:46:16.822Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 26,
      "publicId" : "dfhjghjkdisudgfds7iy105",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T23:46:16.819Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 25,
      "publicId" : "dfhjghjkdisudgfds7iy104",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:16.817Z"
    },
    {
      "mediaId" : 24,
      "publicId" : "dfhjghjkdisudgfds7iy103",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:16.814Z"
    },
    {
      "mediaId" : 23,
      "publicId" : "dfhjghjkdisudgfds7iy102",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:16.811Z"
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
