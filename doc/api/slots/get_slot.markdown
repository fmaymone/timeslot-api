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

Name : createdAt
Description : Creation of slot

Name : updatedAt
Description : Latest update of slot in db

Name : deletedAt
Description : Delete date of slot or nil

Name : location
Description : Location data for the slot

Name : creator
Description : User who created the slot

Name : settings
Description : User specific settings for the slot (alerts)

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

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos recordings for the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=fQ4p5bVP3heLjaBR0p72ldWSeeE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/25</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/25&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=fQ4p5bVP3heLjaBR0p72ldWSeeE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;06a25ec889d676cdb24b7266a7f4d5f2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d04008ac-d1b2-449e-bc1b-ee7d2874a8ae
X-Runtime: 0.033015
Content-Length: 1253</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 25,
  "title" : "Slot title 27",
  "createdAt" : "2015-05-19T10:51:50.413Z",
  "updatedAt" : "2015-05-19T10:51:50.413Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-01T03:44:02.000Z",
  "visibility" : "public",
  "location" : null,
  "creator" : {
    "id" : 146,
    "username" : "User 143",
    "createdAt" : "2015-05-19T10:51:50.406Z",
    "updatedAt" : "2015-05-19T10:51:50.406Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "1110001100"
  },
  "notes" : [],
  "likes" : 3,
  "commentsCounter" : 0,
  "shareUrl" : "http://localhost:3100/abcd1234",
  "photos" : [
    {
      "mediaId" : 21,
      "clyid" : "dfhjghjkdisudgfds7iy18",
      "postition" : 0
    },
    {
      "mediaId" : 22,
      "clyid" : "dfhjghjkdisudgfds7iy19",
      "postition" : 1
    },
    {
      "mediaId" : 23,
      "clyid" : "dfhjghjkdisudgfds7iy20",
      "postition" : 2
    },
    {
      "mediaId" : 24,
      "clyid" : "dfhjghjkdisudgfds7iy21",
      "postition" : 3
    },
    {
      "mediaId" : 25,
      "clyid" : "dfhjghjkdisudgfds7iy22",
      "postition" : 4
    },
    {
      "mediaId" : 26,
      "clyid" : "dfhjghjkdisudgfds7iy23",
      "postition" : 5
    }
  ],
  "voices" : [
    {
      "mediaId" : 27,
      "clyid" : "dfhjghjkdisudgfds7iy24",
      "position" : 6,
      "duration=" : null
    },
    {
      "mediaId" : 28,
      "clyid" : "dfhjghjkdisudgfds7iy25",
      "position" : 7,
      "duration=" : null
    }
  ],
  "videos" : [
    {
      "mediaId" : 29,
      "clyid" : "dfhjghjkdisudgfds7iy26",
      "position" : 8,
      "duration=" : null,
      "thumbnail=" : null
    },
    {
      "mediaId" : 30,
      "clyid" : "dfhjghjkdisudgfds7iy27",
      "position" : 9,
      "duration=" : null,
      "thumbnail=" : null
    }
  ]
}
```
