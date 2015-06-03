# Slots API

## Get Likes for Slot

### GET /v1/slots/:id/likes

returns a list of all likes for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see Likes data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the likes for


### Response Fields

Name : array
Description : containing creation date of the Like and details of the user who made the Like

### Request

#### Headers

<pre>Authorization: Token token=CEQLCSWHsMBl582zDkO8TsrwfHM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/49/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/49/likes&quot; -X GET \
	-H &quot;Authorization: Token token=CEQLCSWHsMBl582zDkO8TsrwfHM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;29a700c8c56acf5563943e4e03c33e42&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0f8fc68c-27f7-4a10-a4bb-2d29f5412ae5
X-Runtime: 0.022463
Content-Length: 781</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-06-03T10:39:39.554Z",
    "liker" : {
      "id" : 240,
      "username" : "User 237",
      "createdAt" : "2015-06-03T10:39:39.551Z",
      "updatedAt" : "2015-06-03T10:39:39.551Z",
      "deletedAt" : null,
      "image" : null
    }
  },
  {
    "createdAt" : "2015-06-03T10:39:39.558Z",
    "liker" : {
      "id" : 241,
      "username" : "User 238",
      "createdAt" : "2015-06-03T10:39:39.556Z",
      "updatedAt" : "2015-06-03T10:39:39.556Z",
      "deletedAt" : null,
      "image" : null
    }
  },
  {
    "createdAt" : "2015-06-03T10:39:39.567Z",
    "liker" : {
      "id" : 242,
      "username" : "User 239",
      "createdAt" : "2015-06-03T10:39:39.561Z",
      "updatedAt" : "2015-06-03T10:39:39.561Z",
      "deletedAt" : null,
      "image" : null
    }
  },
  {
    "createdAt" : "2015-06-03T10:39:39.588Z",
    "liker" : {
      "id" : 244,
      "username" : "User 241",
      "createdAt" : "2015-06-03T10:39:39.582Z",
      "updatedAt" : "2015-06-03T10:39:39.582Z",
      "deletedAt" : null,
      "image" : "dfhjghjkdisudgfds7iy37"
    }
  }
]
```
