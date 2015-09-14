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
Authorization: Token token=wDAU0K9fCaziDFglYVOLrhGVdUA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=wDAU0K9fCaziDFglYVOLrhGVdUA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0e13026a9df51cd5f9bdab12ac6eaec8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9d9e4976-2f35-4528-9d53-e75b7767d1b6
X-Runtime: 0.044204
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
    "createdAt" : "2015-09-14T10:32:42.825Z",
    "updatedAt" : "2015-09-14T10:32:42.825Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 179,
      "username" : "User 151",
      "createdAt" : "2015-09-14T10:32:42.814Z",
      "updatedAt" : "2015-09-14T10:32:42.814Z",
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
