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

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=2oXd_-dlHHHq7fgagYwXrZHm5hI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/25</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/25&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=2oXd_-dlHHHq7fgagYwXrZHm5hI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5b7994f331c44a388dbc87400c3c2f4a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 515176da-f1ba-4107-87d1-f6140580050f
X-Runtime: 0.039814
Content-Length: 1590</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 25,
  "title" : "Slot title 27",
  "startDate" : "2019-09-01T03:44:02.000Z",
  "createdAt" : "2015-06-15T08:50:37.531Z",
  "updatedAt" : "2015-06-15T08:50:37.531Z",
  "deletedAt" : null,
  "endDate" : "2019-10-01T03:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 147,
    "username" : "User 144",
    "createdAt" : "2015-06-15T08:50:37.522Z",
    "updatedAt" : "2015-06-15T08:50:37.522Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 30,
      "clyid" : "dfhjghjkdisudgfds7iy27",
      "position" : 9,
      "localId" : null,
      "mediaType" : "video",
      "duration=" : null,
      "thumbnail=" : null
    },
    {
      "mediaId" : 29,
      "clyid" : "dfhjghjkdisudgfds7iy26",
      "position" : 8,
      "localId" : null,
      "mediaType" : "video",
      "duration=" : null,
      "thumbnail=" : null
    },
    {
      "mediaId" : 28,
      "clyid" : "dfhjghjkdisudgfds7iy25",
      "position" : 7,
      "localId" : null,
      "mediaType" : "voice",
      "duration=" : null
    },
    {
      "mediaId" : 27,
      "clyid" : "dfhjghjkdisudgfds7iy24",
      "position" : 6,
      "localId" : null,
      "mediaType" : "voice",
      "duration=" : null
    },
    {
      "mediaId" : 26,
      "clyid" : "dfhjghjkdisudgfds7iy23",
      "position" : 5,
      "localId" : null,
      "mediaType" : "photo"
    },
    {
      "mediaId" : 25,
      "clyid" : "dfhjghjkdisudgfds7iy22",
      "position" : 4,
      "localId" : null,
      "mediaType" : "photo"
    },
    {
      "mediaId" : 24,
      "clyid" : "dfhjghjkdisudgfds7iy21",
      "position" : 3,
      "localId" : null,
      "mediaType" : "photo"
    },
    {
      "mediaId" : 23,
      "clyid" : "dfhjghjkdisudgfds7iy20",
      "position" : 2,
      "localId" : null,
      "mediaType" : "photo"
    },
    {
      "mediaId" : 22,
      "clyid" : "dfhjghjkdisudgfds7iy19",
      "position" : 1,
      "localId" : null,
      "mediaType" : "photo"
    },
    {
      "mediaId" : 21,
      "clyid" : "dfhjghjkdisudgfds7iy18",
      "position" : 0,
      "localId" : null,
      "mediaType" : "photo"
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
