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
Authorization: Token token=VbQN6M0NhbDeoYHUz8QCs7iDh3M
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=VbQN6M0NhbDeoYHUz8QCs7iDh3M&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c0559cbe58de363476184fc59d79ac81&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1f178315-ec09-4d68-9923-fad2b4a226c1
X-Runtime: 0.036902
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
    "createdAt" : "2015-10-03T22:30:41.543Z",
    "updatedAt" : "2015-10-03T22:30:41.543Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 179,
      "username" : "User 151",
      "createdAt" : "2015-10-03T22:30:41.528Z",
      "updatedAt" : "2015-10-03T22:30:41.528Z",
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
