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
Authorization: Token token=Sai_Y4JJB4ed_7IdGnbTiJ3FiHo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Sai_Y4JJB4ed_7IdGnbTiJ3FiHo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ed4bbb2824b47ed116df8fefb2f6c75f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a940db75-b3df-4491-9e9e-dff6c64719c3
X-Runtime: 0.036586
Vary: Origin
Content-Length: 1903</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : "3d412f6d-de94-4493-813f-0051d3ac6303",
    "name" : "Testgroup 4",
    "image" : "",
    "owner" : {
      "id" : 2,
      "username" : "User 80",
      "createdAt" : "2016-01-29T19:38:54.729Z",
      "updatedAt" : "2016-01-29T19:38:54.729Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-29T19:38:54.731Z",
    "updatedAt" : "2016-01-29T19:38:54.731Z",
    "deletedAt" : null
  },
  {
    "id" : "0a50bfd2-d4f9-4155-8d74-329031642f9a",
    "name" : "Testgroup 5",
    "image" : "",
    "owner" : {
      "id" : 3,
      "username" : "User 81",
      "createdAt" : "2016-01-29T19:38:54.744Z",
      "updatedAt" : "2016-01-29T19:38:54.744Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-29T19:38:54.746Z",
    "updatedAt" : "2016-01-29T19:38:54.746Z",
    "deletedAt" : null
  },
  {
    "id" : "7053a6c5-b534-45ba-88c5-fc9e8443bc11",
    "name" : "Testgroup 6",
    "image" : "",
    "owner" : {
      "id" : 4,
      "username" : "User 82",
      "createdAt" : "2016-01-29T19:38:54.756Z",
      "updatedAt" : "2016-01-29T19:38:54.756Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-29T19:38:54.758Z",
    "updatedAt" : "2016-01-29T19:38:54.758Z",
    "deletedAt" : null
  },
  {
    "id" : "dd8d877b-68e8-4282-97d4-7fb2ad7fe327",
    "name" : "Testgroup 7",
    "image" : "",
    "owner" : {
      "id" : 1,
      "username" : "User 79",
      "createdAt" : "2016-01-29T19:38:54.723Z",
      "updatedAt" : "2016-01-29T19:38:54.723Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-29T19:38:54.766Z",
    "updatedAt" : "2016-01-29T19:38:54.766Z",
    "deletedAt" : null
  },
  {
    "id" : "aba2c8fc-6544-4968-9729-138259552a34",
    "name" : "Testgroup 8",
    "image" : "",
    "owner" : {
      "id" : 1,
      "username" : "User 79",
      "createdAt" : "2016-01-29T19:38:54.723Z",
      "updatedAt" : "2016-01-29T19:38:54.723Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-29T19:38:54.773Z",
    "updatedAt" : "2016-01-29T19:38:54.773Z",
    "deletedAt" : null
  },
  {
    "id" : "353db26f-8ce4-4c61-842e-81b7f5f92b06",
    "name" : "Testgroup 9",
    "image" : "",
    "owner" : {
      "id" : 1,
      "username" : "User 79",
      "createdAt" : "2016-01-29T19:38:54.723Z",
      "updatedAt" : "2016-01-29T19:38:54.723Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-29T19:38:54.780Z",
    "updatedAt" : "2016-01-29T19:38:54.780Z",
    "deletedAt" : null
  }
]
```
