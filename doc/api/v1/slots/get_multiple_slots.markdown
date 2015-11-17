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
Authorization: Token token=s5BiqslqSZlwXvRLs-gRnGVjyQg
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "ids" : [
    15,
    14
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots&quot; -d &#39;{&quot;ids&quot;:[15,14]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=s5BiqslqSZlwXvRLs-gRnGVjyQg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b7d418f38e7e48252faba19c4f9da87c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 731ef7eb-bd8b-4e12-b4db-cf512566af60
X-Runtime: 0.068900
Vary: Origin
Content-Length: 4136</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 15,
    "title" : "Slot title 32",
    "startDate" : "2019-09-09T11:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:38.782Z",
    "updatedAt" : "2015-11-17T12:12:38.782Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 147,
      "username" : "User 198",
      "createdAt" : "2015-11-17T12:12:38.777Z",
      "updatedAt" : "2015-11-17T12:12:38.777Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 62,
        "publicId" : "dfhjghjkdisudgfds7iy66",
        "position" : 18,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-11-17T12:12:38.796Z",
        "duration" : null,
        "title" : "Title 64"
      },
      {
        "mediaId" : 61,
        "publicId" : "dfhjghjkdisudgfds7iy65",
        "position" : 17,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-11-17T12:12:38.794Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 60,
        "publicId" : "dfhjghjkdisudgfds7iy64",
        "position" : 16,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-11-17T12:12:38.792Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 59,
        "publicId" : "dfhjghjkdisudgfds7iy63",
        "position" : 15,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-11-17T12:12:38.789Z"
      },
      {
        "mediaId" : 58,
        "publicId" : "dfhjghjkdisudgfds7iy62",
        "position" : 14,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-11-17T12:12:38.787Z"
      },
      {
        "mediaId" : 57,
        "publicId" : "dfhjghjkdisudgfds7iy61",
        "position" : 13,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-11-17T12:12:38.784Z"
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
    "url" : "http://example.org/v1/slots/15"
  },
  {
    "id" : 14,
    "title" : "Slot title 31",
    "startDate" : "2019-09-08T10:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:38.721Z",
    "updatedAt" : "2015-11-17T12:12:38.721Z",
    "deletedAt" : null,
    "endDate" : "2019-10-08T10:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 139,
      "username" : "User 190",
      "createdAt" : "2015-11-17T12:12:38.714Z",
      "updatedAt" : "2015-11-17T12:12:38.714Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [
      {
        "mediaId" : 56,
        "publicId" : "dfhjghjkdisudgfds7iy60",
        "position" : 12,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-11-17T12:12:38.773Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 55,
        "publicId" : "dfhjghjkdisudgfds7iy59",
        "position" : 11,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-11-17T12:12:38.768Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 54,
        "publicId" : "dfhjghjkdisudgfds7iy58",
        "position" : 10,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-11-17T12:12:38.763Z",
        "duration" : null,
        "title" : "Title 56"
      },
      {
        "mediaId" : 53,
        "publicId" : "dfhjghjkdisudgfds7iy57",
        "position" : 9,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-11-17T12:12:38.759Z",
        "duration" : null,
        "title" : "Title 55"
      },
      {
        "mediaId" : 52,
        "publicId" : "dfhjghjkdisudgfds7iy56",
        "position" : 8,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-11-17T12:12:38.754Z"
      },
      {
        "mediaId" : 51,
        "publicId" : "dfhjghjkdisudgfds7iy55",
        "position" : 7,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-11-17T12:12:38.749Z"
      },
      {
        "mediaId" : 50,
        "publicId" : "dfhjghjkdisudgfds7iy54",
        "position" : 6,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-11-17T12:12:38.744Z"
      },
      {
        "mediaId" : 49,
        "publicId" : "dfhjghjkdisudgfds7iy53",
        "position" : 5,
        "localId" : null,
        "mediaType" : "audio",
        "createdAt" : "2015-11-17T12:12:38.737Z",
        "duration" : null,
        "title" : "Title 51"
      },
      {
        "mediaId" : 48,
        "publicId" : "dfhjghjkdisudgfds7iy52",
        "position" : 4,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-11-17T12:12:38.734Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 47,
        "publicId" : "dfhjghjkdisudgfds7iy51",
        "position" : 3,
        "localId" : null,
        "mediaType" : "video",
        "createdAt" : "2015-11-17T12:12:38.732Z",
        "duration" : null,
        "thumbnail" : null
      },
      {
        "mediaId" : 46,
        "publicId" : "dfhjghjkdisudgfds7iy50",
        "position" : 2,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-11-17T12:12:38.729Z"
      },
      {
        "mediaId" : 45,
        "publicId" : "dfhjghjkdisudgfds7iy49",
        "position" : 1,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-11-17T12:12:38.727Z"
      },
      {
        "mediaId" : 44,
        "publicId" : "dfhjghjkdisudgfds7iy48",
        "position" : 0,
        "localId" : null,
        "mediaType" : "image",
        "createdAt" : "2015-11-17T12:12:38.724Z"
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
    "url" : "http://example.org/v1/slots/14"
  }
]
```
