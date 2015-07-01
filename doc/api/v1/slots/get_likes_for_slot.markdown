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

<pre>Authorization: Token token=5ZXE2hx4FVjFKAZBdduYCcegPoY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/50/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/50/likes&quot; -X GET \
	-H &quot;Authorization: Token token=5ZXE2hx4FVjFKAZBdduYCcegPoY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d04b34dd2840afba1abbce8921b9ad37&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 309a7a56-d504-4a61-9e34-79555e834346
X-Runtime: 0.029525
Content-Length: 893</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-06-22T08:44:24.797Z",
    "liker" : {
      "id" : 198,
      "username" : "User 195",
      "createdAt" : "2015-06-22T08:44:24.795Z",
      "updatedAt" : "2015-06-22T08:44:24.795Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-22T08:44:24.802Z",
    "liker" : {
      "id" : 199,
      "username" : "User 196",
      "createdAt" : "2015-06-22T08:44:24.800Z",
      "updatedAt" : "2015-06-22T08:44:24.800Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-22T08:44:24.808Z",
    "liker" : {
      "id" : 200,
      "username" : "User 197",
      "createdAt" : "2015-06-22T08:44:24.805Z",
      "updatedAt" : "2015-06-22T08:44:24.805Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-22T08:44:24.892Z",
    "liker" : {
      "id" : 202,
      "username" : "User 199",
      "createdAt" : "2015-06-22T08:44:24.887Z",
      "updatedAt" : "2015-06-22T08:44:24.887Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy37",
        "localId" : null
      }
    }
  }
]
```
