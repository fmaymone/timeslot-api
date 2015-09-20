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

<pre>Authorization: Token token=tZfHEZSt8b7GdU_1Rlhr18hSWmA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/60/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/60/likes&quot; -X GET \
	-H &quot;Authorization: Token token=tZfHEZSt8b7GdU_1Rlhr18hSWmA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4f6b7dc3234492a2b5dddf79c4a827e3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 18701b12-4d57-40c8-bfc2-815ea636877e
X-Runtime: 0.039795
Vary: Origin
Content-Length: 893</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-09-20T18:49:37.327Z",
    "liker" : {
      "id" : 282,
      "username" : "User 246",
      "createdAt" : "2015-09-20T18:49:37.318Z",
      "updatedAt" : "2015-09-20T18:49:37.318Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-20T18:49:37.345Z",
    "liker" : {
      "id" : 283,
      "username" : "User 247",
      "createdAt" : "2015-09-20T18:49:37.335Z",
      "updatedAt" : "2015-09-20T18:49:37.335Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-20T18:49:37.362Z",
    "liker" : {
      "id" : 284,
      "username" : "User 248",
      "createdAt" : "2015-09-20T18:49:37.353Z",
      "updatedAt" : "2015-09-20T18:49:37.353Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-20T18:49:37.454Z",
    "liker" : {
      "id" : 286,
      "username" : "User 250",
      "createdAt" : "2015-09-20T18:49:37.445Z",
      "updatedAt" : "2015-09-20T18:49:37.445Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy53",
        "localId" : null
      }
    }
  }
]
```
