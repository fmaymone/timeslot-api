# Groups API

## Get slots in a group

### GET /v1/groups/:group_id/slots

returns 200 and a list of all slots

returns 404 if ID is invalid

### Parameters

Name : group_id *- required -*
Description : ID of the group to get slots for


### Response Fields

Name : groupId
Description : ID of the group

Name : slotCount
Description : Number of all slot in this group

Name : upcomingCount
Description : Number of upcoming group slots

Name : slots
Description : Array of group slots

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : alerts
Description : Alerts for the slot for the current user

Name : photos
Description : Photos for the slot

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos for the slot

Name : url
Description : direct url to fetch the slot

Name : createdAt
Description : Creation datetime of the slot

Name : updatedAt
Description : Last update of the slot

Name : deletedAt
Description : Deletion datetime of the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=yelVf8zi2yHMTJEYggpBFAHeuyI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/18/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/18/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=yelVf8zi2yHMTJEYggpBFAHeuyI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e3b330f4f3d70c1c77101e36de0bad54&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fb03a202-2c80-4d03-af4d-b8e726c517e8
X-Runtime: 0.121754
Content-Length: 2695</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 18,
  "slotCount" : 4,
  "upcomingCount" : 0,
  "slots" : [
    {
      "id" : 19,
      "title" : "Slot title 21",
      "startDate" : "2014-09-28T13:31:02.000Z",
      "createdAt" : "2015-06-03T10:39:36.990Z",
      "updatedAt" : "2015-06-03T10:39:36.990Z",
      "deletedAt" : null,
      "endDate" : "2014-10-22T21:44:02.000Z",
      "location" : {
        "id" : 22,
        "name" : "Acapulco",
        "street" : "",
        "city" : "",
        "postcode" : "",
        "country" : "",
        "latitude" : null,
        "longitude" : null
      },
      "creator" : {
        "id" : 98,
        "username" : "User 95",
        "createdAt" : "2015-06-03T10:39:36.980Z",
        "updatedAt" : "2015-06-03T10:39:36.980Z",
        "deletedAt" : null,
        "image" : null
      },
      "notes" : [],
      "photos" : [],
      "voices" : [],
      "videos" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 18
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/19"
    },
    {
      "id" : 20,
      "title" : "Slot title 22",
      "startDate" : "2014-09-28T13:31:02.000Z",
      "createdAt" : "2015-06-03T10:39:37.002Z",
      "updatedAt" : "2015-06-03T10:39:37.002Z",
      "deletedAt" : null,
      "endDate" : "2014-10-23T22:44:02.000Z",
      "location" : {
        "id" : 23,
        "name" : "Acapulco",
        "street" : "",
        "city" : "",
        "postcode" : "",
        "country" : "",
        "latitude" : null,
        "longitude" : null
      },
      "creator" : {
        "id" : 100,
        "username" : "User 97",
        "createdAt" : "2015-06-03T10:39:36.993Z",
        "updatedAt" : "2015-06-03T10:39:36.993Z",
        "deletedAt" : null,
        "image" : null
      },
      "notes" : [],
      "photos" : [],
      "voices" : [],
      "videos" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 18
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/20"
    },
    {
      "id" : 21,
      "title" : "Slot title 23",
      "startDate" : "2014-09-28T13:31:02.000Z",
      "createdAt" : "2015-06-03T10:39:37.016Z",
      "updatedAt" : "2015-06-03T10:39:37.016Z",
      "deletedAt" : null,
      "endDate" : "2014-10-24T23:44:02.000Z",
      "location" : {
        "id" : 24,
        "name" : "Acapulco",
        "street" : "",
        "city" : "",
        "postcode" : "",
        "country" : "",
        "latitude" : null,
        "longitude" : null
      },
      "creator" : {
        "id" : 102,
        "username" : "User 99",
        "createdAt" : "2015-06-03T10:39:37.005Z",
        "updatedAt" : "2015-06-03T10:39:37.005Z",
        "deletedAt" : null,
        "image" : null
      },
      "notes" : [],
      "photos" : [],
      "voices" : [],
      "videos" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 18
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/21"
    },
    {
      "id" : 22,
      "title" : "Slot title 24",
      "startDate" : "2014-09-28T13:31:02.000Z",
      "createdAt" : "2015-06-03T10:39:37.031Z",
      "updatedAt" : "2015-06-03T10:39:37.031Z",
      "deletedAt" : null,
      "endDate" : "2014-10-25T00:44:02.000Z",
      "location" : {
        "id" : 25,
        "name" : "Acapulco",
        "street" : "",
        "city" : "",
        "postcode" : "",
        "country" : "",
        "latitude" : null,
        "longitude" : null
      },
      "creator" : {
        "id" : 104,
        "username" : "User 101",
        "createdAt" : "2015-06-03T10:39:37.019Z",
        "updatedAt" : "2015-06-03T10:39:37.019Z",
        "deletedAt" : null,
        "image" : null
      },
      "notes" : [],
      "photos" : [],
      "voices" : [],
      "videos" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 18
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/22"
    }
  ]
}
```
