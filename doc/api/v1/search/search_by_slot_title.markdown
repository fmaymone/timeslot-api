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
Authorization: Token token=2TsGK1xqQzlmBghLZH-AbkvOqwE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=2TsGK1xqQzlmBghLZH-AbkvOqwE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2b8ad04440fb483bcae5830fc886522d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3bfce235-f832-431d-b548-412c8d567838
X-Runtime: 0.033334
Vary: Origin
Content-Length: 567</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 30,
    "title" : "Timeslot Party Berlin 2015",
    "startDate" : "2019-09-24T02:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:13.644Z",
    "updatedAt" : "2015-11-17T23:46:13.644Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 171,
      "username" : "User 215",
      "createdAt" : "2015-11-17T23:46:13.629Z",
      "updatedAt" : "2015-11-17T23:46:13.629Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/30"
  }
]
```
