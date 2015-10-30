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
Authorization: Token token=UuVu570rPtTV4yUPK1R418C1qUE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=UuVu570rPtTV4yUPK1R418C1qUE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;05849b00ebf0574cf34b667251ef55da&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ecd7e4d6-8fce-4446-8eda-7ed854fc36fb
X-Runtime: 0.067848
Vary: Origin
Content-Length: 675</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 1,
    "name" : "Testgroup 6",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/1"
  },
  {
    "id" : 2,
    "name" : "Testgroup 7",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/2"
  },
  {
    "id" : 3,
    "name" : "Testgroup 8",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/3"
  },
  {
    "id" : 4,
    "name" : "Testgroup 9",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/4"
  },
  {
    "id" : 5,
    "name" : "Testgroup 10",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/5"
  },
  {
    "id" : 6,
    "name" : "Testgroup 11",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/6"
  }
]
```
