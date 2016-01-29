# Search API

## Search by group name

### GET /v1/search/group

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search


### Response Fields

Name : id
Description : ID of the group

Name : name
Description : name of the group

Name : upcomingCount
Description : Number of upcoming group slots

Name : next
Description : Start date and Time of the next upcoming slot

Name : image
Description : URL of the group image

Name : url
Description : ressource URL for the group

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=iMtHtb-bC18O8OcUsk5SHzHCeyI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/group?query=timeslot+developer</pre>

#### Query Parameters

<pre>query: timeslot developer</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/group?query=timeslot+developer&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=iMtHtb-bC18O8OcUsk5SHzHCeyI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5d1764a192566058ddd576e0b6b2e260&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 10ca106d-939c-4c9a-851a-a3cecebacabb
X-Runtime: 0.011887
Vary: Origin
Content-Length: 343</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : "9b0d9f06-5319-4873-8dbf-7f25e2c64898",
    "name" : "Timeslot Developer Group (Berlin)",
    "image" : "",
    "owner" : {
      "id" : 174,
      "username" : "User 237",
      "createdAt" : "2016-01-29T19:39:03.146Z",
      "updatedAt" : "2016-01-29T19:39:03.146Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-29T19:39:03.148Z",
    "updatedAt" : "2016-01-29T19:39:03.148Z",
    "deletedAt" : null
  }
]
```
