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
Authorization: Token token=teHWiDjt-AFBXBTSBfX-PZ7lZpg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=teHWiDjt-AFBXBTSBfX-PZ7lZpg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;154638dc0b5a9d4e95b208a7337f456f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 633d95ca-4758-4754-9126-7ac3e28c9f64
X-Runtime: 0.055651
Content-Length: 636</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
