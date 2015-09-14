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

<pre>Authorization: Token token=aLK0FIBhrz8AD1B_6tq1Ji61rWg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/58/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/58/likes&quot; -X GET \
	-H &quot;Authorization: Token token=aLK0FIBhrz8AD1B_6tq1Ji61rWg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a8e3c421dbcb6f75e20cb8d5d39f73d2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8ca2be41-e5a3-4a41-8994-2f34fb31a040
X-Runtime: 0.034279
Vary: Origin
Content-Length: 893</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-09-14T10:32:57.817Z",
    "liker" : {
      "id" : 279,
      "username" : "User 245",
      "createdAt" : "2015-09-14T10:32:57.811Z",
      "updatedAt" : "2015-09-14T10:32:57.811Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-14T10:32:57.836Z",
    "liker" : {
      "id" : 280,
      "username" : "User 246",
      "createdAt" : "2015-09-14T10:32:57.831Z",
      "updatedAt" : "2015-09-14T10:32:57.831Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-14T10:32:57.849Z",
    "liker" : {
      "id" : 281,
      "username" : "User 247",
      "createdAt" : "2015-09-14T10:32:57.841Z",
      "updatedAt" : "2015-09-14T10:32:57.841Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-14T10:32:57.969Z",
    "liker" : {
      "id" : 283,
      "username" : "User 249",
      "createdAt" : "2015-09-14T10:32:57.950Z",
      "updatedAt" : "2015-09-14T10:32:57.950Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy53",
        "localId" : null
      }
    }
  }
]
```
