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
Authorization: Token token=9XrCMtA-j-dzkloAmjWeY1kpFlE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=9XrCMtA-j-dzkloAmjWeY1kpFlE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8c851d42dd2eff241c6421df3a3d4ab0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6be88ac6-be3d-44dc-adc3-8e8e6d38d4eb
X-Runtime: 0.025257
Vary: Origin
Content-Length: 595</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 8,
    "title" : "Timeslot Party Berlin 2015",
    "startDate" : "2019-09-01T03:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:03.208Z",
    "updatedAt" : "2015-10-30T15:01:03.208Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 107,
      "username" : "User 156",
      "createdAt" : "2015-10-30T15:01:03.198Z",
      "updatedAt" : "2015-10-30T15:01:03.198Z",
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
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/8"
  }
]
```
