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
Authorization: Token token=aYxN3gmMGBfHHhFjJ49l9ElGJ1M
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/25</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/25&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=aYxN3gmMGBfHHhFjJ49l9ElGJ1M&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;0a67daf7d982f155b3251ca06d9b396d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: be4bac99-32a2-483d-8cf2-667c5b0bac16
X-Runtime: 0.035826
Content-Length: 1253</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 25,
  "title" : "Slot title 27",
  "createdAt" : "2015-05-06T11:28:50.591Z",
  "updatedAt" : "2015-05-06T11:28:50.591Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-01T03:44:02.000Z",
  "visibility" : "public",
  "location" : null,
  "creator" : {
    "id" : 136,
    "username" : "User 136",
    "createdAt" : "2015-05-06T11:28:50.586Z",
    "updatedAt" : "2015-05-06T11:28:50.586Z",
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
}</pre>
