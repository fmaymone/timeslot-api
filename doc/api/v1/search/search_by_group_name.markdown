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
Authorization: Token token=GZ0tLDgfILFMOpfPjrzTth_mpOg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/group?query=timeslot+developer</pre>

#### Query Parameters

<pre>query: timeslot developer</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/group?query=timeslot+developer&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=GZ0tLDgfILFMOpfPjrzTth_mpOg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5092aa8f38ee84a14e2734ad3434e246&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 03d12500-bebd-4f23-a9f0-d5a22cc39df1
X-Runtime: 0.008664
Vary: Origin
Content-Length: 353</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 32,
    "name" : "Timeslot Developer Group (Berlin)",
    "image" : "",
    "uuid" : "b94aa796-0104-444f-afed-55479bdd05bb",
    "owner" : {
      "id" : 171,
      "username" : "User 234",
      "createdAt" : "2016-01-21T23:11:39.565Z",
      "updatedAt" : "2016-01-21T23:11:39.565Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-21T23:11:39.566Z",
    "updatedAt" : "2016-01-21T23:11:39.566Z",
    "deletedAt" : null
  }
]
```
