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
Authorization: Token token=wjh2GdAKOwfP9wOXUitFjVqO46w
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/3</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/3&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=wjh2GdAKOwfP9wOXUitFjVqO46w&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;982de06cdce5bfd937e1f67fb969b6fb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 32b82764-226c-4070-b2fb-114067cc62f2
X-Runtime: 0.017557
Vary: Origin
Content-Length: 1413</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 3,
  "title" : "Slot title 73",
  "startDate" : "2019-09-23T04:44:02.000Z",
  "createdAt" : "2016-01-29T19:39:08.872Z",
  "updatedAt" : "2016-01-29T19:39:08.872Z",
  "deletedAt" : null,
  "endDate" : "2019-10-23T04:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 5,
    "username" : "User 279",
    "createdAt" : "2016-01-29T19:39:08.859Z",
    "updatedAt" : "2016-01-29T19:39:08.859Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 6,
      "publicId" : "dfhjghjkdisudgfds7iy53",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2016-01-29T19:39:08.896Z",
      "duration" : null,
      "title" : "Title 52"
    },
    {
      "mediaId" : 5,
      "publicId" : "dfhjghjkdisudgfds7iy52",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-01-29T19:39:08.892Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 4,
      "publicId" : "dfhjghjkdisudgfds7iy51",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-01-29T19:39:08.888Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 3,
      "publicId" : "dfhjghjkdisudgfds7iy50",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-29T19:39:08.885Z"
    },
    {
      "mediaId" : 2,
      "publicId" : "dfhjghjkdisudgfds7iy49",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-29T19:39:08.881Z"
    },
    {
      "mediaId" : 1,
      "publicId" : "dfhjghjkdisudgfds7iy48",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-29T19:39:08.876Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "reslotsCounter" : 0,
  "likes" : 3,
  "commentsCounter" : 0
}
```
