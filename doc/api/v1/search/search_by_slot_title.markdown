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
Authorization: Token token=GmTF4qrTcCQbxdk4uotUB0FRYrk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=GmTF4qrTcCQbxdk4uotUB0FRYrk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1f04958d4b5780640e45fe977c485059&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1d39587c-2f8d-468a-a9c0-89304f0ff4b6
X-Runtime: 0.017162
Vary: Origin
Content-Length: 525</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 30,
    "title" : "Timeslot Party Berlin 2015",
    "startDate" : "2019-09-24T02:44:02.000Z",
    "createdAt" : "2015-11-27T15:44:23.576Z",
    "updatedAt" : "2015-11-27T15:44:23.576Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 171,
      "username" : "User 211",
      "createdAt" : "2015-11-27T15:44:23.563Z",
      "updatedAt" : "2015-11-27T15:44:23.563Z",
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
