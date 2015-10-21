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
Authorization: Token token=2c8bGS_3mT1VrJIIwPmVXKbWinA
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "ids" : [
    8,
    7
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots&quot; -d &#39;{&quot;ids&quot;:[8,7]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=2c8bGS_3mT1VrJIIwPmVXKbWinA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;38ee588ce3e8734ef5e5aef7718463d3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9b31e17b-ddb4-4b7b-9bf8-d464ce1883c8
X-Runtime: 0.107851
Vary: Origin
Content-Length: 4120</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 8,
    "title" : "Slot title 27",
    "startDate" : "2019-09-01T03:44:02.000Z",
    "createdAt" : "2015-10-14T11:49:43.970Z",
    "updatedAt" : "2015-10-14T11:49:43.970Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 115,
      "username" : "User 167",
      "createdAt" : "2015-10-14T11:49:43.963Z",
      "updatedAt" : "2015-10-14T11:49:43.963Z",
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
        "publicId" : "dfhjghjkdisudgfds7iy24",
        "position" : 18,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-10-14T11:49:43.992Z",
        "duration" : null,
        "title" : "Title 22"
      },
      {
        "mediaId" : 20,
        "publicId" : "dfhjghjkdisudgfds7iy23",
        "position" : 17,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-14T11:49:43.989Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 19,
        "publicId" : "dfhjghjkdisudgfds7iy22",
        "position" : 16,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-14T11:49:43.986Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 18,
        "publicId" : "dfhjghjkdisudgfds7iy21",
        "position" : 15,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-14T11:49:43.983Z"
      },
      {
        "mediaId" : 17,
        "publicId" : "dfhjghjkdisudgfds7iy20",
        "position" : 14,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-14T11:49:43.980Z"
      },
      {
        "mediaId" : 16,
        "publicId" : "dfhjghjkdisudgfds7iy19",
        "position" : 13,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-14T11:49:43.977Z"
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
    "url" : "http://example.org/v1/slots/8"
  },
  {
    "id" : 7,
    "title" : "Slot title 26",
    "startDate" : "2019-09-27T02:44:02.000Z",
    "createdAt" : "2015-10-14T11:49:43.876Z",
    "updatedAt" : "2015-10-14T11:49:43.876Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 107,
      "username" : "User 159",
      "createdAt" : "2015-10-14T11:49:43.870Z",
      "updatedAt" : "2015-10-14T11:49:43.870Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 15,
        "publicId" : "dfhjghjkdisudgfds7iy18",
        "position" : 12,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-14T11:49:43.959Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 14,
        "publicId" : "dfhjghjkdisudgfds7iy17",
        "position" : 11,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-14T11:49:43.948Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 13,
        "publicId" : "dfhjghjkdisudgfds7iy16",
        "position" : 10,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-10-14T11:49:43.941Z",
        "duration" : null,
        "title" : "Title 14"
      },
      {
        "mediaId" : 12,
        "publicId" : "dfhjghjkdisudgfds7iy15",
        "position" : 9,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-10-14T11:49:43.935Z",
        "duration" : null,
        "title" : "Title 13"
      },
      {
        "mediaId" : 11,
        "publicId" : "dfhjghjkdisudgfds7iy14",
        "position" : 8,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-14T11:49:43.929Z"
      },
      {
        "mediaId" : 10,
        "publicId" : "dfhjghjkdisudgfds7iy13",
        "position" : 7,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-14T11:49:43.916Z"
      },
      {
        "mediaId" : 9,
        "publicId" : "dfhjghjkdisudgfds7iy12",
        "position" : 6,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-14T11:49:43.903Z"
      },
      {
        "mediaId" : 8,
        "publicId" : "dfhjghjkdisudgfds7iy11",
        "position" : 5,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-10-14T11:49:43.894Z",
        "duration" : null,
        "title" : "Title 9"
      },
      {
        "mediaId" : 7,
        "publicId" : "dfhjghjkdisudgfds7iy10",
        "position" : 4,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-14T11:49:43.891Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 6,
        "publicId" : "dfhjghjkdisudgfds7iy9",
        "position" : 3,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-10-14T11:49:43.888Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 5,
        "publicId" : "dfhjghjkdisudgfds7iy8",
        "position" : 2,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-14T11:49:43.885Z"
      },
      {
        "mediaId" : 4,
        "publicId" : "dfhjghjkdisudgfds7iy7",
        "position" : 1,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-14T11:49:43.882Z"
      },
      {
        "mediaId" : 3,
        "publicId" : "dfhjghjkdisudgfds7iy6",
        "position" : 0,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-10-14T11:49:43.879Z"
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
    "url" : "http://example.org/v1/slots/7"
  }
]
```
