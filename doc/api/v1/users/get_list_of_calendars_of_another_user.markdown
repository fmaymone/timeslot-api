# Users API

## Get list of calendars of another user

### GET /v1/users/:id/calendars

Includes all public calendars of this user and non-public calendars where user and current user are members.

returns array of calendars

returns 404 if current user not friend with other user

### Parameters

Name : id
Description : ID of the user to get the calendars for.

### Request

#### Headers

<pre>Authorization: Token token=j_2gXbbTczZYijQ5eOfyNVwXI0w
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/186/calendars</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/186/calendars&quot; -X GET \
	-H &quot;Authorization: Token token=j_2gXbbTczZYijQ5eOfyNVwXI0w&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;84874405a7df54e70c946e11dfd766ce&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c6750003-cdc7-438d-b5d4-3c0971351c90
X-Runtime: 0.013670
Vary: Origin
Content-Length: 1342</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : "36bfe343-1b58-4577-8ec0-8d8f8fcb9aaf",
    "name" : "Testgroup 63",
    "image" : "",
    "public" : true,
    "owner" : {
      "id" : 186,
      "username" : "User 482",
      "createdAt" : "2016-04-04T20:50:34.629Z",
      "updatedAt" : "2016-04-04T20:50:34.629Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-04-04T20:50:34.648Z",
    "updatedAt" : "2016-04-04T20:50:34.648Z",
    "deletedAt" : null
  },
  {
    "id" : "038747a5-a03d-4f2e-9ba9-a28fba559780",
    "name" : "Testgroup 64",
    "image" : "",
    "public" : true,
    "owner" : {
      "id" : 186,
      "username" : "User 482",
      "createdAt" : "2016-04-04T20:50:34.629Z",
      "updatedAt" : "2016-04-04T20:50:34.629Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-04-04T20:50:34.653Z",
    "updatedAt" : "2016-04-04T20:50:34.653Z",
    "deletedAt" : null
  },
  {
    "id" : "48348d93-2858-4cb2-9ed6-95c59ed1fef8",
    "name" : "Testgroup 65",
    "image" : "",
    "public" : true,
    "owner" : {
      "id" : 187,
      "username" : "User 483",
      "createdAt" : "2016-04-04T20:50:34.658Z",
      "updatedAt" : "2016-04-04T20:50:34.658Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-04-04T20:50:34.660Z",
    "updatedAt" : "2016-04-04T20:50:34.660Z",
    "deletedAt" : null
  },
  {
    "id" : "483b0e70-34ce-48f0-b449-3a5394fc495f",
    "name" : "Testgroup 66",
    "image" : "",
    "public" : false,
    "owner" : {
      "id" : 188,
      "username" : "User 484",
      "createdAt" : "2016-04-04T20:50:34.670Z",
      "updatedAt" : "2016-04-04T20:50:34.670Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-04-04T20:50:34.672Z",
    "updatedAt" : "2016-04-04T20:50:34.672Z",
    "deletedAt" : null
  }
]
```
