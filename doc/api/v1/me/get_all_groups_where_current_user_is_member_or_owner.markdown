# Me API

## Get all groups where current user is member or owner

### GET /v1/me/slotgroups

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
Authorization: Token token=gFEqkQcQDxKTE_8aD6cp7e326TI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slotgroups</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/slotgroups&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=gFEqkQcQDxKTE_8aD6cp7e326TI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;688d4f165318cd7f2702f926942d1b1f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c69732cd-0a9e-4f5c-bd2d-99ea7779b5e9
X-Runtime: 0.013600
Vary: Origin
Content-Length: 1006</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : "81fb7708-7602-4159-af4e-eed2ae3a4ef2",
    "name" : "Testgroup 36",
    "image" : "",
    "public" : false,
    "owner" : {
      "id" : 54,
      "username" : "User 216",
      "createdAt" : "2016-04-04T20:50:24.397Z",
      "updatedAt" : "2016-04-04T20:50:24.397Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-04-04T20:50:24.426Z",
    "updatedAt" : "2016-04-04T20:50:24.426Z",
    "deletedAt" : null
  },
  {
    "id" : "a29197f2-7e5e-4941-ae47-84ec7ba1f8d6",
    "name" : "Testgroup 37",
    "image" : "",
    "public" : false,
    "owner" : {
      "id" : 54,
      "username" : "User 216",
      "createdAt" : "2016-04-04T20:50:24.397Z",
      "updatedAt" : "2016-04-04T20:50:24.397Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-04-04T20:50:24.432Z",
    "updatedAt" : "2016-04-04T20:50:24.432Z",
    "deletedAt" : null
  },
  {
    "id" : "202fd383-9ce7-4d98-b2eb-a6b08db88282",
    "name" : "Testgroup 38",
    "image" : "",
    "public" : false,
    "owner" : {
      "id" : 54,
      "username" : "User 216",
      "createdAt" : "2016-04-04T20:50:24.397Z",
      "updatedAt" : "2016-04-04T20:50:24.397Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-04-04T20:50:24.437Z",
    "updatedAt" : "2016-04-04T20:50:24.437Z",
    "deletedAt" : null
  }
]
```
