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
Authorization: Token token=A_3DhoeRuJzPWT1PgHFosMeVwSo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=A_3DhoeRuJzPWT1PgHFosMeVwSo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ee1ec3660f62c84565804710a722ae0f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d36afece-0434-4eeb-9198-b157971e17d1
X-Runtime: 0.012497
Vary: Origin
Content-Length: 525</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 29,
    "title" : "Timeslot Party Berlin 2015",
    "startDate" : "2019-09-27T05:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:33.378Z",
    "updatedAt" : "2015-12-23T11:18:33.378Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 167,
      "username" : "User 220",
      "createdAt" : "2015-12-23T11:18:33.365Z",
      "updatedAt" : "2015-12-23T11:18:33.365Z",
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
