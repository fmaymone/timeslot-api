# Slots API

## Get slot

### GET /v1/slots/:id

if a user is authenticated the slot settings (alerts) will be included

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to get


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

Name : reslotsCounter
Description : Number of reslots for this slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=oGwgFpnQLkids84zrREWEcnOJVI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/9</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/9&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=oGwgFpnQLkids84zrREWEcnOJVI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f80e9f255baaeea91468ba0aaa9676d6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 91412138-9e90-4568-86d4-ad69ff52a045
X-Runtime: 0.054435
Vary: Origin
Content-Length: 2603</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 9,
  "title" : "Slot title 28",
  "startDate" : "2019-09-02T04:44:02.000Z",
  "createdAt" : "2015-10-14T11:49:44.197Z",
  "updatedAt" : "2015-10-14T11:49:44.197Z",
  "deletedAt" : null,
  "endDate" : "2019-10-02T04:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 117,
    "username" : "User 169",
    "createdAt" : "2015-10-14T11:49:44.189Z",
    "updatedAt" : "2015-10-14T11:49:44.189Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 34,
      "publicId" : "dfhjghjkdisudgfds7iy37",
      "position" : 12,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-14T11:49:44.304Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 33,
      "publicId" : "dfhjghjkdisudgfds7iy36",
      "position" : 11,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-14T11:49:44.298Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 32,
      "publicId" : "dfhjghjkdisudgfds7iy35",
      "position" : 10,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-14T11:49:44.289Z",
      "duration" : null,
      "title" : "Title 33"
    },
    {
      "mediaId" : 31,
      "publicId" : "dfhjghjkdisudgfds7iy34",
      "position" : 9,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-14T11:49:44.280Z",
      "duration" : null,
      "title" : "Title 32"
    },
    {
      "mediaId" : 30,
      "publicId" : "dfhjghjkdisudgfds7iy33",
      "position" : 8,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:44.265Z"
    },
    {
      "mediaId" : 29,
      "publicId" : "dfhjghjkdisudgfds7iy32",
      "position" : 7,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:44.259Z"
    },
    {
      "mediaId" : 28,
      "publicId" : "dfhjghjkdisudgfds7iy31",
      "position" : 6,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:44.254Z"
    },
    {
      "mediaId" : 27,
      "publicId" : "dfhjghjkdisudgfds7iy30",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-14T11:49:44.215Z",
      "duration" : null,
      "title" : "Title 28"
    },
    {
      "mediaId" : 26,
      "publicId" : "dfhjghjkdisudgfds7iy29",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-14T11:49:44.212Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 25,
      "publicId" : "dfhjghjkdisudgfds7iy28",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-14T11:49:44.209Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 24,
      "publicId" : "dfhjghjkdisudgfds7iy27",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:44.206Z"
    },
    {
      "mediaId" : 23,
      "publicId" : "dfhjghjkdisudgfds7iy26",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:44.203Z"
    },
    {
      "mediaId" : 22,
      "publicId" : "dfhjghjkdisudgfds7iy25",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:44.200Z"
    }
  ],
  "settings" : {
    "alerts" : "1110001100"
  },
  "visibility" : "public",
  "reslotsCounter" : 0,
  "likes" : 3,
  "commentsCounter" : 0,
  "shareUrl" : "http://localhost:3100/abcd1234"
}
```
