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

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=Ar031rooCDaTSfWUj0zl0xr756c
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "ids" : [
    11,
    10
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots&quot; -d &#39;{&quot;ids&quot;:[11,10]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Ar031rooCDaTSfWUj0zl0xr756c&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4877bb26b1f67cf35360a6e35128f459&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f5206608-8f7d-428e-b74d-4e05991e2629
X-Runtime: 0.059445
Vary: Origin
Content-Length: 4136</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 11,
    "title" : "Slot title 27",
    "startDate" : "2019-09-04T06:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:03.398Z",
    "updatedAt" : "2015-10-30T15:01:03.398Z",
    "deletedAt" : null,
    "endDate" : "2019-10-04T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 125,
      "username" : "User 174",
      "createdAt" : "2015-10-30T15:01:03.393Z",
      "updatedAt" : "2015-10-30T15:01:03.393Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 39,
        "publicId" : "dfhjghjkdisudgfds7iy42",
        "position" : 18,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-10-30T15:01:03.417Z",
        "duration" : null,
        "title" : "Title 40"
      },
      {
        "mediaId" : 38,
        "publicId" : "dfhjghjkdisudgfds7iy41",
        "position" : 17,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-30T15:01:03.413Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 37,
        "publicId" : "dfhjghjkdisudgfds7iy40",
        "position" : 16,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-30T15:01:03.411Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 36,
        "publicId" : "dfhjghjkdisudgfds7iy39",
        "position" : 15,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-30T15:01:03.408Z"
      },
      {
        "mediaId" : 35,
        "publicId" : "dfhjghjkdisudgfds7iy38",
        "position" : 14,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-30T15:01:03.405Z"
      },
      {
        "mediaId" : 34,
        "publicId" : "dfhjghjkdisudgfds7iy37",
        "position" : 13,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-30T15:01:03.402Z"
      }
    ],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "private",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/11"
  },
  {
    "id" : 10,
    "title" : "Slot title 26",
    "startDate" : "2019-09-03T05:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:03.336Z",
    "updatedAt" : "2015-10-30T15:01:03.336Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 117,
      "username" : "User 166",
      "createdAt" : "2015-10-30T15:01:03.329Z",
      "updatedAt" : "2015-10-30T15:01:03.329Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 33,
        "publicId" : "dfhjghjkdisudgfds7iy36",
        "position" : 12,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-30T15:01:03.390Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 32,
        "publicId" : "dfhjghjkdisudgfds7iy35",
        "position" : 11,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-30T15:01:03.385Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 31,
        "publicId" : "dfhjghjkdisudgfds7iy34",
        "position" : 10,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-10-30T15:01:03.380Z",
        "duration" : null,
        "title" : "Title 32"
      },
      {
        "mediaId" : 30,
        "publicId" : "dfhjghjkdisudgfds7iy33",
        "position" : 9,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-10-30T15:01:03.375Z",
        "duration" : null,
        "title" : "Title 31"
      },
      {
        "mediaId" : 29,
        "publicId" : "dfhjghjkdisudgfds7iy32",
        "position" : 8,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-30T15:01:03.370Z"
      },
      {
        "mediaId" : 28,
        "publicId" : "dfhjghjkdisudgfds7iy31",
        "position" : 7,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-30T15:01:03.365Z"
      },
      {
        "mediaId" : 27,
        "publicId" : "dfhjghjkdisudgfds7iy30",
        "position" : 6,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-30T15:01:03.360Z"
      },
      {
        "mediaId" : 26,
        "publicId" : "dfhjghjkdisudgfds7iy29",
        "position" : 5,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-10-30T15:01:03.351Z",
        "duration" : null,
        "title" : "Title 27"
      },
      {
        "mediaId" : 25,
        "publicId" : "dfhjghjkdisudgfds7iy28",
        "position" : 4,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-30T15:01:03.349Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 24,
        "publicId" : "dfhjghjkdisudgfds7iy27",
        "position" : 3,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-30T15:01:03.346Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 23,
        "publicId" : "dfhjghjkdisudgfds7iy26",
        "position" : 2,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-30T15:01:03.344Z"
      },
      {
        "mediaId" : 22,
        "publicId" : "dfhjghjkdisudgfds7iy25",
        "position" : 1,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-30T15:01:03.341Z"
      },
      {
        "mediaId" : 21,
        "publicId" : "dfhjghjkdisudgfds7iy24",
        "position" : 0,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-30T15:01:03.339Z"
      }
    ],
    "settings" : {
      "alerts" : "1110001100"
    },
    "visibility" : "private",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/10"
  }
]
```
