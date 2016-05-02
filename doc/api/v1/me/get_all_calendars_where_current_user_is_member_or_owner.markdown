# Me API

## Get all calendars where current user is member or owner

### GET /v1/me/calendars

returns an array of calendars

### Response Fields

Name : id
Description : UUID of the calendar

Name : name
Description : name of the calendar

Name : image
Description : URL of the calendar image

Name : public
Description : visibility of the calendar

Name : owner
Description : user details of the calendar owner

Name : showInSchedule
Description : are calendar slots shown in schedule

Name : createdAt
Description : Creation datetime of the calendar

Name : updatedAt
Description : Last update of the calendaar

Name : deletedAt
Description : Deletion datetime of the calendar

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=LB_B3WkUqznGEzphiFxam_2aW98
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/calendars</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/calendars&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=LB_B3WkUqznGEzphiFxam_2aW98&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;fcca5d1f6960a554117b79fa7e7bd274&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e2bbea9a-0a4b-4743-85cd-057ee2020bb2
X-Runtime: 0.019809
Content-Length: 1431</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "id" : "d466d358-c44b-42d4-8f8a-c6d63edeaf00",
      "name" : "Testgroup 145",
      "image" : "",
      "description" : null,
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : false,
      "createdAt" : "2016-05-01T22:54:11.087Z",
      "updatedAt" : "2016-05-01T22:54:11.087Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 59,
        "username" : "User 373",
        "createdAt" : "2016-05-01T22:54:11.055Z",
        "updatedAt" : "2016-05-01T22:54:11.055Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        59
      ],
      "memberCount" : 1,
      "slotCount" : 0,
      "showInSchedule" : false
    },
    {
      "id" : "a7104ce3-739d-4044-ba1e-7d784bf7050b",
      "name" : "Testgroup 146",
      "image" : "",
      "description" : null,
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : false,
      "createdAt" : "2016-05-01T22:54:11.095Z",
      "updatedAt" : "2016-05-01T22:54:11.095Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 59,
        "username" : "User 373",
        "createdAt" : "2016-05-01T22:54:11.055Z",
        "updatedAt" : "2016-05-01T22:54:11.055Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        59
      ],
      "memberCount" : 1,
      "slotCount" : 0,
      "showInSchedule" : false
    },
    {
      "id" : "b8045019-58aa-4399-a5e4-bce5046cf700",
      "name" : "Testgroup 147",
      "image" : "",
      "description" : null,
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : false,
      "createdAt" : "2016-05-01T22:54:11.104Z",
      "updatedAt" : "2016-05-01T22:54:11.104Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 59,
        "username" : "User 373",
        "createdAt" : "2016-05-01T22:54:11.055Z",
        "updatedAt" : "2016-05-01T22:54:11.055Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        59
      ],
      "memberCount" : 1,
      "slotCount" : 0,
      "showInSchedule" : false
    }
  ]
}
```
