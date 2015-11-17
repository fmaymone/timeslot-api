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
Authorization: Token token=rzNfr666934LwDwsnOgBeqBPCII
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/36</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/36&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=rzNfr666934LwDwsnOgBeqBPCII&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e7f7e19966b22a84c8567717a7586208&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e9eb2e6b-9bfc-416c-8792-c1a2364d5013
X-Runtime: 0.023349
Vary: Origin
Content-Length: 1649</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 36,
  "title" : "Timeslot",
  "startDate" : "2019-09-02T07:44:02.000Z",
  "createdAt" : "2015-11-17T23:46:14.114Z",
  "updatedAt" : "2015-11-17T23:46:14.114Z",
  "deletedAt" : null,
  "endDate" : "2019-10-02T07:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 204,
    "username" : "User 248",
    "createdAt" : "2015-11-17T23:46:14.094Z",
    "updatedAt" : "2015-11-17T23:46:14.094Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 82,
      "publicId" : "dfhjghjkdisudgfds7iy86",
      "position" : 6,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T23:46:14.164Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 81,
      "publicId" : "dfhjghjkdisudgfds7iy85",
      "position" : 5,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T23:46:14.159Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 80,
      "publicId" : "dfhjghjkdisudgfds7iy84",
      "position" : 4,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-11-17T23:46:14.154Z",
      "duration" : null,
      "title" : "Title 82"
    },
    {
      "mediaId" : 79,
      "publicId" : "dfhjghjkdisudgfds7iy83",
      "position" : 3,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-11-17T23:46:14.149Z",
      "duration" : null,
      "title" : "Title 81"
    },
    {
      "mediaId" : 78,
      "publicId" : "dfhjghjkdisudgfds7iy82",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:14.144Z"
    },
    {
      "mediaId" : 77,
      "publicId" : "dfhjghjkdisudgfds7iy81",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:14.139Z"
    },
    {
      "mediaId" : 76,
      "publicId" : "dfhjghjkdisudgfds7iy80",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:14.130Z"
    }
  ],
  "settings" : {
    "alerts" : "1110001100"
  },
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 208
  },
  "parent" : {
    "id" : 35
  },
  "visibility" : "public",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
