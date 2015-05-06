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
Authorization: Token token=2mnQBFsDirrfjCegy2OrUgB81dE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=2mnQBFsDirrfjCegy2OrUgB81dE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;d04cee0bbbe53daa32a8d279c8a24aae&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 660eefbf-5db4-4f17-9a45-0141e2e3c1ca
X-Runtime: 0.067538
Content-Length: 679</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>[
  {
    "id" : 11,
    "name" : "Testgroup 11",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/11"
  },
  {
    "id" : 10,
    "name" : "Testgroup 10",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/10"
  },
  {
    "id" : 9,
    "name" : "Testgroup 9",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/9"
  },
  {
    "id" : 8,
    "name" : "Testgroup 8",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/8"
  },
  {
    "id" : 7,
    "name" : "Testgroup 7",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/7"
  },
  {
    "id" : 6,
    "name" : "Testgroup 6",
    "upcomingCount" : 0,
    "next" : null,
    "image" : null,
    "url" : "http://example.org/v1/groups/6"
  }
]</pre>
