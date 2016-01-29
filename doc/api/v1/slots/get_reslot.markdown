# Slots API

## Get Reslot

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

Name : slotter
Description : contains ID of the User who did reslot

Name : parent
Description : contains ID of the original slot that was reslottet

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=QD4EoifQIxeoGRQPGGvIKSwNmO4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/9</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/9&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=QD4EoifQIxeoGRQPGGvIKSwNmO4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;292f9fcd148bb7af4709ec562da48b8a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ae6de13b-d012-4936-93dd-9014b23bbabb
X-Runtime: 0.018700
Vary: Origin
Content-Length: 935</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 9,
  "title" : "Timeslot",
  "startDate" : "2019-09-01T09:44:02.000Z",
  "createdAt" : "2016-01-29T19:39:09.172Z",
  "updatedAt" : "2016-01-29T19:39:09.172Z",
  "deletedAt" : null,
  "endDate" : "2019-10-01T09:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 20,
    "username" : "User 301",
    "createdAt" : "2016-01-29T19:39:09.139Z",
    "updatedAt" : "2016-01-29T19:39:09.139Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 9,
      "publicId" : "dfhjghjkdisudgfds7iy63",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-29T19:39:09.241Z"
    },
    {
      "mediaId" : 8,
      "publicId" : "dfhjghjkdisudgfds7iy62",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-29T19:39:09.233Z"
    },
    {
      "mediaId" : 7,
      "publicId" : "dfhjghjkdisudgfds7iy61",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-29T19:39:09.226Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 24
  },
  "parent" : {
    "id" : 8
  },
  "likes" : 0,
  "commentsCounter" : 0
}
```
