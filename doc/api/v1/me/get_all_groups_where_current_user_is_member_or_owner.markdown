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
Authorization: Token token=1CrOZ5IMXgVRoIDrnN2zi_SL8uk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slotgroups</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/slotgroups&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=1CrOZ5IMXgVRoIDrnN2zi_SL8uk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;813a7a92e4989ff8f4a597e8ec2aff75&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dd075609-9b36-4326-9970-91823341d01a
X-Runtime: 0.016585
Vary: Origin
Content-Length: 961</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : "9c05095a-46d1-4e5b-a402-b799608850fb",
    "name" : "Testgroup 33",
    "image" : "",
    "owner" : {
      "id" : 54,
      "username" : "User 198",
      "createdAt" : "2016-03-03T13:47:58.014Z",
      "updatedAt" : "2016-03-03T13:47:58.014Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-03-03T13:47:58.046Z",
    "updatedAt" : "2016-03-03T13:47:58.046Z",
    "deletedAt" : null
  },
  {
    "id" : "e771cb81-93cc-4d5d-962c-3d90fa3aa8ce",
    "name" : "Testgroup 34",
    "image" : "",
    "owner" : {
      "id" : 54,
      "username" : "User 198",
      "createdAt" : "2016-03-03T13:47:58.014Z",
      "updatedAt" : "2016-03-03T13:47:58.014Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-03-03T13:47:58.053Z",
    "updatedAt" : "2016-03-03T13:47:58.053Z",
    "deletedAt" : null
  },
  {
    "id" : "9980310b-88e5-432e-9a58-7df9fca7d51f",
    "name" : "Testgroup 35",
    "image" : "",
    "owner" : {
      "id" : 54,
      "username" : "User 198",
      "createdAt" : "2016-03-03T13:47:58.014Z",
      "updatedAt" : "2016-03-03T13:47:58.014Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-03-03T13:47:58.058Z",
    "updatedAt" : "2016-03-03T13:47:58.058Z",
    "deletedAt" : null
  }
]
```
