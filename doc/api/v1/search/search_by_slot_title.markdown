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
Authorization: Token token=B1PGOxQoQHamW7YkbZY_uBJxNm0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=B1PGOxQoQHamW7YkbZY_uBJxNm0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7fd96c4ecb0d85a7efe4dba1b346d66c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dff5fa44-cc1c-40ae-8219-6a4dc43b32ca
X-Runtime: 0.021015
Vary: Origin
Content-Length: 525</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 24,
    "title" : "Timeslot Party Berlin 2015",
    "startDate" : "2019-09-01T06:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:39.494Z",
    "updatedAt" : "2016-01-21T23:11:39.494Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 165,
      "username" : "User 228",
      "createdAt" : "2016-01-21T23:11:39.484Z",
      "updatedAt" : "2016-01-21T23:11:39.484Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
