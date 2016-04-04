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
Authorization: Token token=XcmqOvnEzi1x3kxlAW9tyYr3XrI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=XcmqOvnEzi1x3kxlAW9tyYr3XrI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8dfb872a1d521e4316bc23272e733bcd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 50c5ca60-b613-4902-8897-dc3988ef0419
X-Runtime: 0.013701
Vary: Origin
Content-Length: 490</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 27,
    "title" : "Timeslot Party Berlin 2015",
    "startDate" : "2019-09-05T10:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:26.085Z",
    "updatedAt" : "2016-04-04T20:50:26.085Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T10:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 112,
      "username" : "User 259",
      "createdAt" : "2016-04-04T20:50:26.068Z",
      "updatedAt" : "2016-04-04T20:50:26.068Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
