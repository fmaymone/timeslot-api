# Slots API

## Get multiple slots

### POST /v1/slots

if a user is authenticated the slot settings (alerts) will be included

returns 404 if an ID is invalid

### Parameters

Name : ids *- required -*
Description : Array of slot IDs to get


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

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=c1LAqCy2u3OWGNOaitynwWuDKk0
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "ids" : [
    33,
    32
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots&quot; -d &#39;{&quot;ids&quot;:[33,32]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=c1LAqCy2u3OWGNOaitynwWuDKk0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;04b595eb6136376f5cd88da2d5a36a14&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bc457f06-6978-469c-b572-df45133cabe2
X-Runtime: 0.048668
Vary: Origin
Content-Length: 3992</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 33,
    "title" : "Slot title 50",
    "startDate" : "2019-09-27T05:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:50.771Z",
    "updatedAt" : "2015-12-04T16:56:50.771Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 193,
      "username" : "User 231",
      "createdAt" : "2015-12-04T16:56:50.767Z",
      "updatedAt" : "2015-12-04T16:56:50.767Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 62,
        "publicId" : "dfhjghjkdisudgfds7iy65",
        "position" : 18,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-12-04T16:56:50.786Z",
        "duration" : null,
        "title" : "Title 64"
      },
      {
        "mediaId" : 61,
        "publicId" : "dfhjghjkdisudgfds7iy64",
        "position" : 17,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-12-04T16:56:50.784Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 60,
        "publicId" : "dfhjghjkdisudgfds7iy63",
        "position" : 16,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-12-04T16:56:50.781Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 59,
        "publicId" : "dfhjghjkdisudgfds7iy62",
        "position" : 15,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-12-04T16:56:50.779Z"
      },
      {
        "mediaId" : 58,
        "publicId" : "dfhjghjkdisudgfds7iy61",
        "position" : 14,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-12-04T16:56:50.776Z"
      },
      {
        "mediaId" : 57,
        "publicId" : "dfhjghjkdisudgfds7iy60",
        "position" : 13,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-12-04T16:56:50.773Z"
      }
    ],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 32,
    "title" : "Slot title 49",
    "startDate" : "2019-09-26T04:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:50.706Z",
    "updatedAt" : "2015-12-04T16:56:50.706Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 185,
      "username" : "User 223",
      "createdAt" : "2015-12-04T16:56:50.700Z",
      "updatedAt" : "2015-12-04T16:56:50.700Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 56,
        "publicId" : "dfhjghjkdisudgfds7iy59",
        "position" : 12,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-12-04T16:56:50.764Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 55,
        "publicId" : "dfhjghjkdisudgfds7iy58",
        "position" : 11,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-12-04T16:56:50.759Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 54,
        "publicId" : "dfhjghjkdisudgfds7iy57",
        "position" : 10,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-12-04T16:56:50.754Z",
        "duration" : null,
        "title" : "Title 56"
      },
      {
        "mediaId" : 53,
        "publicId" : "dfhjghjkdisudgfds7iy56",
        "position" : 9,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-12-04T16:56:50.749Z",
        "duration" : null,
        "title" : "Title 55"
      },
      {
        "mediaId" : 52,
        "publicId" : "dfhjghjkdisudgfds7iy55",
        "position" : 8,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-12-04T16:56:50.745Z"
      },
      {
        "mediaId" : 51,
        "publicId" : "dfhjghjkdisudgfds7iy54",
        "position" : 7,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-12-04T16:56:50.736Z"
      },
      {
        "mediaId" : 50,
        "publicId" : "dfhjghjkdisudgfds7iy53",
        "position" : 6,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-12-04T16:56:50.729Z"
      },
      {
        "mediaId" : 49,
        "publicId" : "dfhjghjkdisudgfds7iy52",
        "position" : 5,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-12-04T16:56:50.721Z",
        "duration" : null,
        "title" : "Title 51"
      },
      {
        "mediaId" : 48,
        "publicId" : "dfhjghjkdisudgfds7iy51",
        "position" : 4,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-12-04T16:56:50.718Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 47,
        "publicId" : "dfhjghjkdisudgfds7iy50",
        "position" : 3,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-12-04T16:56:50.716Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 46,
        "publicId" : "dfhjghjkdisudgfds7iy49",
        "position" : 2,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-12-04T16:56:50.713Z"
      },
      {
        "mediaId" : 45,
        "publicId" : "dfhjghjkdisudgfds7iy48",
        "position" : 1,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-12-04T16:56:50.711Z"
      },
      {
        "mediaId" : 44,
        "publicId" : "dfhjghjkdisudgfds7iy47",
        "position" : 0,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-12-04T16:56:50.708Z"
      }
    ],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
