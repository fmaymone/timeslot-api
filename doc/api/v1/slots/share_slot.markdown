# Slots API

## Share slot

### GET /v1/slots/:id/share

if a user is authenticated the slot shareUrl will be included

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to share


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

Name : shareUrl
Description : Share URL for this slot, nil if not yet shared

Name : images
Description : Images for the slot

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos recordings for the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=QiT6T63zp7GL-OPnatKBRnJvA84
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/62/share</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/62/share&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=QiT6T63zp7GL-OPnatKBRnJvA84&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;141fe22a246a84eff34211ee59b8df18&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 140fc698-2ea2-477a-b4da-88508d4f4e02
X-Runtime: 0.036658
Content-Length: 1659</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 62,
  "title" : "Slot title 51",
  "startDate" : "2019-09-25T03:44:02.000Z",
  "endDate" : "2019-10-25T03:44:02.000Z",
  "createdAt" : "2015-07-02T12:34:20.878Z",
  "updatedAt" : "2015-07-02T12:34:20.878Z",
  "deletedAt" : null,
  "openEnd" : false,
  "location" : null,
  "creator" : {
    "id" : 240,
    "username" : "User 225",
    "createdAt" : "2015-07-02T12:34:20.864Z",
    "updatedAt" : "2015-07-02T12:34:20.864Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 58,
      "publicId" : "dfhjghjkdisudgfds7iy51",
      "position" : 9,
      "localId" : null,
      "mediaType" : "video",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 57,
      "publicId" : "dfhjghjkdisudgfds7iy50",
      "position" : 8,
      "localId" : null,
      "mediaType" : "video",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 56,
      "publicId" : "dfhjghjkdisudgfds7iy49",
      "position" : 7,
      "localId" : null,
      "mediaType" : "audio",
      "duration" : null,
      "title" : null
    },
    {
      "mediaId" : 55,
      "publicId" : "dfhjghjkdisudgfds7iy48",
      "position" : 6,
      "localId" : null,
      "mediaType" : "audio",
      "duration" : null,
      "title" : null
    },
    {
      "mediaId" : 54,
      "publicId" : "dfhjghjkdisudgfds7iy47",
      "position" : 5,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 53,
      "publicId" : "dfhjghjkdisudgfds7iy46",
      "position" : 4,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 52,
      "publicId" : "dfhjghjkdisudgfds7iy45",
      "position" : 3,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 51,
      "publicId" : "dfhjghjkdisudgfds7iy44",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 50,
      "publicId" : "dfhjghjkdisudgfds7iy43",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 49,
      "publicId" : "dfhjghjkdisudgfds7iy42",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image"
    }
  ],
  "settings" : {
    "alerts" : "1110001100"
  },
  "visibility" : "public",
  "likes" : 3,
  "commentsCounter" : 0,
  "shareUrl" : "abcd1234"
}
```
