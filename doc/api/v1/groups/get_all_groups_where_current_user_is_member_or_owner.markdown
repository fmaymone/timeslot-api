# Groups API

## Get all groups where current user is member or owner

### GET /v1/groups

returns an array of groups

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
Authorization: Token token=1vRGKjYeEDqIJ1I10WiB9NZip2Q
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=1vRGKjYeEDqIJ1I10WiB9NZip2Q&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8a413339ae4c83a142ac19f123dc3454&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5702b121-9ee6-4163-9388-689d562ef078
X-Runtime: 0.046286
Vary: Origin
Content-Length: 663</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 1,
    "name" : "Testgroup 6",
    "image" : "",
    "upcomingCount" : 0,
    "next" : null,
    "url" : "http://example.org/v1/groups/1"
  },
  {
    "id" : 2,
    "name" : "Testgroup 7",
    "image" : "",
    "upcomingCount" : 0,
    "next" : null,
    "url" : "http://example.org/v1/groups/2"
  },
  {
    "id" : 3,
    "name" : "Testgroup 8",
    "image" : "",
    "upcomingCount" : 0,
    "next" : null,
    "url" : "http://example.org/v1/groups/3"
  },
  {
    "id" : 4,
    "name" : "Testgroup 9",
    "image" : "",
    "upcomingCount" : 0,
    "next" : null,
    "url" : "http://example.org/v1/groups/4"
  },
  {
    "id" : 5,
    "name" : "Testgroup 10",
    "image" : "",
    "upcomingCount" : 0,
    "next" : null,
    "url" : "http://example.org/v1/groups/5"
  },
  {
    "id" : 6,
    "name" : "Testgroup 11",
    "image" : "",
    "upcomingCount" : 0,
    "next" : null,
    "url" : "http://example.org/v1/groups/6"
  }
]
```
