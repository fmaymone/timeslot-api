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
Authorization: Token token=uWS1FLIGbGBaGvAgYaGcTKUZktY
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "ids" : [
    24,
    23
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots&quot; -d &#39;{&quot;ids&quot;:[24,23]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=uWS1FLIGbGBaGvAgYaGcTKUZktY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ff8776570286153097172d901df4f799&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6744bd10-5c95-4ce4-9681-dd1dbee830c2
X-Runtime: 0.088574
Content-Length: 2568</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 24,
    "title" : "Slot title 26",
    "startDate" : "2019-09-27T02:44:02.000Z",
    "endDate" : "2019-10-27T02:44:02.000Z",
    "createdAt" : "2015-06-27T07:27:13.964Z",
    "updatedAt" : "2015-06-27T07:27:13.964Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 145,
      "username" : "User 142",
      "createdAt" : "2015-06-27T07:27:13.957Z",
      "updatedAt" : "2015-06-27T07:27:13.957Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 20,
        "publicId" : "dfhjghjkdisudgfds7iy17",
        "position" : 12,
        "localId" : null,
        "mediaType" : "image"
      },
      {
        "mediaId" : 19,
        "publicId" : "dfhjghjkdisudgfds7iy16",
        "position" : 11,
        "localId" : null,
        "mediaType" : "image"
      },
      {
        "mediaId" : 18,
        "publicId" : "dfhjghjkdisudgfds7iy15",
        "position" : 10,
        "localId" : null,
        "mediaType" : "image"
      }
    ],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "private",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/24"
  },
  {
    "id" : 23,
    "title" : "Slot title 25",
    "startDate" : "2019-09-26T01:44:02.000Z",
    "endDate" : "2019-10-26T01:44:02.000Z",
    "createdAt" : "2015-06-27T07:27:13.920Z",
    "updatedAt" : "2015-06-27T07:27:13.920Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 144,
      "username" : "User 141",
      "createdAt" : "2015-06-27T07:27:13.913Z",
      "updatedAt" : "2015-06-27T07:27:13.913Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 17,
        "publicId" : "dfhjghjkdisudgfds7iy14",
        "position" : 9,
        "localId" : null,
        "mediaType" : "video",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 16,
        "publicId" : "dfhjghjkdisudgfds7iy13",
        "position" : 8,
        "localId" : null,
        "mediaType" : "video",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 15,
        "publicId" : "dfhjghjkdisudgfds7iy12",
        "position" : 7,
        "localId" : null,
        "mediaType" : "audio",
        "duration" : null,
        "title" : null
      },
      {
        "mediaId" : 14,
        "publicId" : "dfhjghjkdisudgfds7iy11",
        "position" : 6,
        "localId" : null,
        "mediaType" : "audio",
        "duration" : null,
        "title" : null
      },
      {
        "mediaId" : 13,
        "publicId" : "dfhjghjkdisudgfds7iy10",
        "position" : 5,
        "localId" : null,
        "mediaType" : "image"
      },
      {
        "mediaId" : 12,
        "publicId" : "dfhjghjkdisudgfds7iy9",
        "position" : 4,
        "localId" : null,
        "mediaType" : "image"
      },
      {
        "mediaId" : 11,
        "publicId" : "dfhjghjkdisudgfds7iy8",
        "position" : 3,
        "localId" : null,
        "mediaType" : "image"
      },
      {
        "mediaId" : 10,
        "publicId" : "dfhjghjkdisudgfds7iy7",
        "position" : 2,
        "localId" : null,
        "mediaType" : "image"
      },
      {
        "mediaId" : 9,
        "publicId" : "dfhjghjkdisudgfds7iy6",
        "position" : 1,
        "localId" : null,
        "mediaType" : "image"
      },
      {
        "mediaId" : 8,
        "publicId" : "dfhjghjkdisudgfds7iy5",
        "position" : 0,
        "localId" : null,
        "mediaType" : "image"
      }
    ],
    "settings" : {
      "alerts" : "1110001100"
    },
    "visibility" : "private",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/23"
  }
]
```
