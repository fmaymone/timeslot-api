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

Name : shareUrl
Description : Share URL for this slot, nil if not yet shared

Name : images
Description : Images for the slot

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos recordings for the slot

Name : groupId
Description : ID of the group the slot belongs to

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=q-qyznixIJODIi9Fy3gTGegUREg
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/60/move</pre>

#### Body
```javascript
{
  "slotType" : "friends",
  "details" : "true"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/60/move&quot; -d &#39;{&quot;slotType&quot;:&quot;friends&quot;,&quot;details&quot;:&quot;true&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=q-qyznixIJODIi9Fy3gTGegUREg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9f458d26ec67da07a28c1c7520212983&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 73f19771-f35b-45d0-8df0-2808e30b115d
X-Runtime: 0.067050
Content-Length: 1072</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 61,
  "title" : "Slot title 50",
  "startDate" : "2019-09-24T02:44:02.000Z",
  "createdAt" : "2015-06-15T11:19:15.622Z",
  "updatedAt" : "2015-06-15T11:19:15.622Z",
  "deletedAt" : null,
  "endDate" : "2019-10-24T02:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 226,
    "username" : "User 223",
    "createdAt" : "2015-06-15T11:19:15.603Z",
    "updatedAt" : "2015-06-15T11:19:15.603Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "photos" : [
    {
      "mediaId" : 46,
      "clyid" : "dfhjghjkdisudgfds7iy39",
      "position" : 0,
      "localId" : null
    },
    {
      "mediaId" : 47,
      "clyid" : "dfhjghjkdisudgfds7iy40",
      "position" : 1,
      "localId" : null
    },
    {
      "mediaId" : 48,
      "clyid" : "dfhjghjkdisudgfds7iy41",
      "position" : 2,
      "localId" : null
    }
  ],
  "voices" : [],
  "videos" : [],
  "media" : [
    {
      "mediaId" : 48,
      "clyid" : "dfhjghjkdisudgfds7iy41",
      "position" : 2,
      "localId" : null,
      "mediaType" : "photo"
    },
    {
      "mediaId" : 47,
      "clyid" : "dfhjghjkdisudgfds7iy40",
      "position" : 1,
      "localId" : null,
      "mediaType" : "photo"
    },
    {
      "mediaId" : 46,
      "clyid" : "dfhjghjkdisudgfds7iy39",
      "position" : 0,
      "localId" : null,
      "mediaType" : "photo"
    }
  ],
  "settings" : {
    "alerts" : "0000000000"
  },
  "visibility" : "friends",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
