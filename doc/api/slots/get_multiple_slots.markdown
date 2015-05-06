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
Description : Counter for likes of the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : images
Description : Images for the slot

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos recordings for the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=G4bGyvr6tCmK8hi2zsLpxlfgOyQ
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body

<pre>ids[]=24&ids[]=23</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots&quot; -d &#39;ids[]=24&amp;ids[]=23&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=G4bGyvr6tCmK8hi2zsLpxlfgOyQ&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;6cc16f3bfc65bafc78898e47904843e8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3463425a-100b-4794-a55f-16ff9da61683
X-Runtime: 0.046732
Content-Length: 1730</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>[
  {
    "id" : 24,
    "title" : "Slot title 26",
    "locationId" : null,
    "createdAt" : "2015-05-06T11:28:50.521Z",
    "updatedAt" : "2015-05-06T11:28:50.521Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-27T02:44:02.000Z",
    "visibility" : "private",
    "settings" : {
      "alerts" : "0000000000"
    },
    "notes" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "photos" : [
      {
        "mediaId" : 18,
        "clyid" : "dfhjghjkdisudgfds7iy15",
        "postition" : 10
      },
      {
        "mediaId" : 19,
        "clyid" : "dfhjghjkdisudgfds7iy16",
        "postition" : 11
      },
      {
        "mediaId" : 20,
        "clyid" : "dfhjghjkdisudgfds7iy17",
        "postition" : 12
      }
    ],
    "voices" : [],
    "videos" : [],
    "url" : "http://example.org/v1/slots/24",
    "creatorId" : 134
  },
  {
    "id" : 23,
    "title" : "Slot title 25",
    "locationId" : 200719253,
    "createdAt" : "2015-05-06T11:28:50.492Z",
    "updatedAt" : "2015-05-06T11:28:50.492Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-26T01:44:02.000Z",
    "visibility" : "private",
    "settings" : {
      "alerts" : "1110001100"
    },
    "notes" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "photos" : [
      {
        "mediaId" : 8,
        "clyid" : "dfhjghjkdisudgfds7iy5",
        "postition" : 0
      },
      {
        "mediaId" : 9,
        "clyid" : "dfhjghjkdisudgfds7iy6",
        "postition" : 1
      },
      {
        "mediaId" : 10,
        "clyid" : "dfhjghjkdisudgfds7iy7",
        "postition" : 2
      },
      {
        "mediaId" : 11,
        "clyid" : "dfhjghjkdisudgfds7iy8",
        "postition" : 3
      },
      {
        "mediaId" : 12,
        "clyid" : "dfhjghjkdisudgfds7iy9",
        "postition" : 4
      },
      {
        "mediaId" : 13,
        "clyid" : "dfhjghjkdisudgfds7iy10",
        "postition" : 5
      }
    ],
    "voices" : [
      {
        "mediaId" : 14,
        "clyid" : "dfhjghjkdisudgfds7iy11",
        "position" : 6,
        "duration=" : null
      },
      {
        "mediaId" : 15,
        "clyid" : "dfhjghjkdisudgfds7iy12",
        "position" : 7,
        "duration=" : null
      }
    ],
    "videos" : [
      {
        "mediaId" : 16,
        "clyid" : "dfhjghjkdisudgfds7iy13",
        "position" : 8,
        "duration=" : null,
        "thumbnail=" : null
      },
      {
        "mediaId" : 17,
        "clyid" : "dfhjghjkdisudgfds7iy14",
        "position" : 9,
        "duration=" : null,
        "thumbnail=" : null
      }
    ],
    "url" : "http://example.org/v1/slots/23",
    "creatorId" : 133
  }
]</pre>
