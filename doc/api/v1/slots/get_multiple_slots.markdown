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
Authorization: Token token=viRHa-OQY8Ix29_PsUlkS8yDzzQ
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "ids" : [
    26,
    25
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots&quot; -d &#39;{&quot;ids&quot;:[26,25]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=viRHa-OQY8Ix29_PsUlkS8yDzzQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2a8af28c0d1a67c6472fe1e209c4124f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6f3d3a94-f5cd-4c42-90f6-79d27ecf81dd
X-Runtime: 0.098068
Vary: Origin
Content-Length: 4092</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 26,
    "title" : "Slot title 28",
    "startDate" : "2019-09-02T04:44:02.000Z",
    "createdAt" : "2015-09-14T10:32:43.362Z",
    "updatedAt" : "2015-09-14T10:32:43.362Z",
    "deletedAt" : null,
    "endDate" : "2019-10-02T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 197,
      "username" : "User 169",
      "createdAt" : "2015-09-14T10:32:43.357Z",
      "updatedAt" : "2015-09-14T10:32:43.357Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 27,
        "publicId" : "dfhjghjkdisudgfds7iy24",
        "position" : 18,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-09-14T10:32:43.380Z",
        "duration" : null,
        "title" : "Title 22"
      },
      {
        "mediaId" : 26,
        "publicId" : "dfhjghjkdisudgfds7iy23",
        "position" : 17,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-09-14T10:32:43.377Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 25,
        "publicId" : "dfhjghjkdisudgfds7iy22",
        "position" : 16,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-09-14T10:32:43.374Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 24,
        "publicId" : "dfhjghjkdisudgfds7iy21",
        "position" : 15,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-09-14T10:32:43.371Z"
      },
      {
        "mediaId" : 23,
        "publicId" : "dfhjghjkdisudgfds7iy20",
        "position" : 14,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-09-14T10:32:43.368Z"
      },
      {
        "mediaId" : 22,
        "publicId" : "dfhjghjkdisudgfds7iy19",
        "position" : 13,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-09-14T10:32:43.366Z"
      }
    ],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "private",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/26"
  },
  {
    "id" : 25,
    "title" : "Slot title 27",
    "startDate" : "2019-09-01T03:44:02.000Z",
    "createdAt" : "2015-09-14T10:32:43.276Z",
    "updatedAt" : "2015-09-14T10:32:43.276Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 189,
      "username" : "User 161",
      "createdAt" : "2015-09-14T10:32:43.268Z",
      "updatedAt" : "2015-09-14T10:32:43.268Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 21,
        "publicId" : "dfhjghjkdisudgfds7iy18",
        "position" : 12,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-09-14T10:32:43.351Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 20,
        "publicId" : "dfhjghjkdisudgfds7iy17",
        "position" : 11,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-09-14T10:32:43.341Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 19,
        "publicId" : "dfhjghjkdisudgfds7iy16",
        "position" : 10,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-09-14T10:32:43.335Z",
        "duration" : null,
        "title" : "Title 14"
      },
      {
        "mediaId" : 18,
        "publicId" : "dfhjghjkdisudgfds7iy15",
        "position" : 9,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-09-14T10:32:43.329Z",
        "duration" : null,
        "title" : "Title 13"
      },
      {
        "mediaId" : 17,
        "publicId" : "dfhjghjkdisudgfds7iy14",
        "position" : 8,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-09-14T10:32:43.323Z"
      },
      {
        "mediaId" : 16,
        "publicId" : "dfhjghjkdisudgfds7iy13",
        "position" : 7,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-09-14T10:32:43.317Z"
      },
      {
        "mediaId" : 15,
        "publicId" : "dfhjghjkdisudgfds7iy12",
        "position" : 6,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-09-14T10:32:43.308Z"
      },
      {
        "mediaId" : 14,
        "publicId" : "dfhjghjkdisudgfds7iy11",
        "position" : 5,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-09-14T10:32:43.295Z",
        "duration" : null,
        "title" : "Title 9"
      },
      {
        "mediaId" : 13,
        "publicId" : "dfhjghjkdisudgfds7iy10",
        "position" : 4,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-09-14T10:32:43.292Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 12,
        "publicId" : "dfhjghjkdisudgfds7iy9",
        "position" : 3,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-09-14T10:32:43.289Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 11,
        "publicId" : "dfhjghjkdisudgfds7iy8",
        "position" : 2,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-09-14T10:32:43.285Z"
      },
      {
        "mediaId" : 10,
        "publicId" : "dfhjghjkdisudgfds7iy7",
        "position" : 1,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-09-14T10:32:43.282Z"
      },
      {
        "mediaId" : 9,
        "publicId" : "dfhjghjkdisudgfds7iy6",
        "position" : 0,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-09-14T10:32:43.279Z"
      }
    ],
    "settings" : {
      "alerts" : "1110001100"
    },
    "visibility" : "private",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/25"
  }
]
```
