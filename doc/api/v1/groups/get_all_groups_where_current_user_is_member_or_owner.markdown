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
Authorization: Token token=AgfkIkHAqR48uw455aUIJD-HpMc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=AgfkIkHAqR48uw455aUIJD-HpMc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;233510749fd35ccfe8cbc1df63136694&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2fcf9549-d96d-4c11-8e9a-0ee3dba619e3
X-Runtime: 0.031556
Vary: Origin
Content-Length: 1957</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 1,
    "name" : "Testgroup 4",
    "image" : "",
    "uuid" : "c862cb98-9aab-4888-8e66-691d357f3747",
    "owner" : {
      "id" : 2,
      "username" : "User 80",
      "createdAt" : "2016-01-21T23:11:36.377Z",
      "updatedAt" : "2016-01-21T23:11:36.377Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-21T23:11:36.380Z",
    "updatedAt" : "2016-01-21T23:11:36.380Z",
    "deletedAt" : null
  },
  {
    "id" : 2,
    "name" : "Testgroup 5",
    "image" : "",
    "uuid" : "b69828c6-1599-483c-a9b3-a7c0aac5fa6b",
    "owner" : {
      "id" : 3,
      "username" : "User 81",
      "createdAt" : "2016-01-21T23:11:36.391Z",
      "updatedAt" : "2016-01-21T23:11:36.391Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-21T23:11:36.393Z",
    "updatedAt" : "2016-01-21T23:11:36.393Z",
    "deletedAt" : null
  },
  {
    "id" : 3,
    "name" : "Testgroup 6",
    "image" : "",
    "uuid" : "5ac0bcea-4369-4df7-808f-984d16dc6ce0",
    "owner" : {
      "id" : 4,
      "username" : "User 82",
      "createdAt" : "2016-01-21T23:11:36.401Z",
      "updatedAt" : "2016-01-21T23:11:36.401Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-21T23:11:36.403Z",
    "updatedAt" : "2016-01-21T23:11:36.403Z",
    "deletedAt" : null
  },
  {
    "id" : 4,
    "name" : "Testgroup 7",
    "image" : "",
    "uuid" : "183638df-9502-4717-8548-f36f909ce550",
    "owner" : {
      "id" : 1,
      "username" : "User 79",
      "createdAt" : "2016-01-21T23:11:36.370Z",
      "updatedAt" : "2016-01-21T23:11:36.370Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-21T23:11:36.411Z",
    "updatedAt" : "2016-01-21T23:11:36.411Z",
    "deletedAt" : null
  },
  {
    "id" : 5,
    "name" : "Testgroup 8",
    "image" : "",
    "uuid" : "0626f30a-b4ac-45e0-8524-caf3654fed5d",
    "owner" : {
      "id" : 1,
      "username" : "User 79",
      "createdAt" : "2016-01-21T23:11:36.370Z",
      "updatedAt" : "2016-01-21T23:11:36.370Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-21T23:11:36.424Z",
    "updatedAt" : "2016-01-21T23:11:36.424Z",
    "deletedAt" : null
  },
  {
    "id" : 6,
    "name" : "Testgroup 9",
    "image" : "",
    "uuid" : "2fc27d6c-2643-4e6e-bab2-5da0f8910157",
    "owner" : {
      "id" : 1,
      "username" : "User 79",
      "createdAt" : "2016-01-21T23:11:36.370Z",
      "updatedAt" : "2016-01-21T23:11:36.370Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-01-21T23:11:36.430Z",
    "updatedAt" : "2016-01-21T23:11:36.430Z",
    "deletedAt" : null
  }
]
```
