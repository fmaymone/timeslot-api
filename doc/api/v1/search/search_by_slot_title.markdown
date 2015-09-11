# Search API

## Search by slot title

### GET /v1/search/slot

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search


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
Description : Last update of slot

Name : deletedAt
Description : Delete date of slot or nil

Name : location
Description : Location data for the slot

Name : creator
Description : User who created the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=mq2MGgreeJB10d52rJs51mv1wO8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=mq2MGgreeJB10d52rJs51mv1wO8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b345e7d579d92ae3bbea3c8a888123b6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8cb24a1e-a41a-4177-a26c-6d1f8fd0d9db
X-Runtime: 0.032222
Vary: Origin
Content-Length: 578</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 23,
    "title" : "Timeslot Party Berlin 2015",
    "startDate" : "2019-09-26T01:44:02.000Z",
    "createdAt" : "2015-08-30T23:01:47.641Z",
    "updatedAt" : "2015-08-30T23:01:47.641Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 155,
      "username" : "User 150",
      "createdAt" : "2015-08-30T23:01:47.628Z",
      "updatedAt" : "2015-08-30T23:01:47.628Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/23"
  }
]
```
