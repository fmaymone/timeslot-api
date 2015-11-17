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

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=gcGfMOR27gb97DnzY9S_lFYhEi4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/34</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/34&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=gcGfMOR27gb97DnzY9S_lFYhEi4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d813f98f0b27d9afdd36e524e28d0f9b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7a2d9da4-fb25-4bd2-ba88-9718af8d6e22
X-Runtime: 0.028028
Vary: Origin
Content-Length: 2574</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 34,
  "title" : "Slot title 51",
  "startDate" : "2019-09-01T06:44:02.000Z",
  "createdAt" : "2015-11-17T23:46:13.967Z",
  "updatedAt" : "2015-11-17T23:46:13.967Z",
  "deletedAt" : null,
  "endDate" : "2019-10-01T06:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 191,
    "username" : "User 235",
    "createdAt" : "2015-11-17T23:46:13.960Z",
    "updatedAt" : "2015-11-17T23:46:13.960Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 75,
      "publicId" : "dfhjghjkdisudgfds7iy79",
      "position" : 12,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T23:46:14.040Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 74,
      "publicId" : "dfhjghjkdisudgfds7iy78",
      "position" : 11,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T23:46:14.035Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 73,
      "publicId" : "dfhjghjkdisudgfds7iy77",
      "position" : 10,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-11-17T23:46:14.030Z",
      "duration" : null,
      "title" : "Title 75"
    },
    {
      "mediaId" : 72,
      "publicId" : "dfhjghjkdisudgfds7iy76",
      "position" : 9,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-11-17T23:46:14.025Z",
      "duration" : null,
      "title" : "Title 74"
    },
    {
      "mediaId" : 71,
      "publicId" : "dfhjghjkdisudgfds7iy75",
      "position" : 8,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:14.020Z"
    },
    {
      "mediaId" : 70,
      "publicId" : "dfhjghjkdisudgfds7iy74",
      "position" : 7,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:14.016Z"
    },
    {
      "mediaId" : 69,
      "publicId" : "dfhjghjkdisudgfds7iy73",
      "position" : 6,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:14.011Z"
    },
    {
      "mediaId" : 68,
      "publicId" : "dfhjghjkdisudgfds7iy72",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-11-17T23:46:13.983Z",
      "duration" : null,
      "title" : "Title 70"
    },
    {
      "mediaId" : 67,
      "publicId" : "dfhjghjkdisudgfds7iy71",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T23:46:13.980Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 66,
      "publicId" : "dfhjghjkdisudgfds7iy70",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T23:46:13.978Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 65,
      "publicId" : "dfhjghjkdisudgfds7iy69",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:13.976Z"
    },
    {
      "mediaId" : 64,
      "publicId" : "dfhjghjkdisudgfds7iy68",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:13.973Z"
    },
    {
      "mediaId" : 63,
      "publicId" : "dfhjghjkdisudgfds7iy67",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:13.970Z"
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
