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

<pre>Authorization: Token token=optE71eoJWXXGrDiaz-FfkSp9KI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/60/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/60/likes&quot; -X GET \
	-H &quot;Authorization: Token token=optE71eoJWXXGrDiaz-FfkSp9KI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d63245c490fe7b4ebbd74d57769a67f9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 42c7fe72-6efc-4e0b-836a-e5acd4f8b7b3
X-Runtime: 0.049307
Vary: Origin
Content-Length: 893</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-09-28T10:15:57.906Z",
    "liker" : {
      "id" : 282,
      "username" : "User 246",
      "createdAt" : "2015-09-28T10:15:57.902Z",
      "updatedAt" : "2015-09-28T10:15:57.902Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-28T10:15:57.915Z",
    "liker" : {
      "id" : 283,
      "username" : "User 247",
      "createdAt" : "2015-09-28T10:15:57.908Z",
      "updatedAt" : "2015-09-28T10:15:57.908Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-28T10:15:57.921Z",
    "liker" : {
      "id" : 284,
      "username" : "User 248",
      "createdAt" : "2015-09-28T10:15:57.918Z",
      "updatedAt" : "2015-09-28T10:15:57.918Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-28T10:15:58.027Z",
    "liker" : {
      "id" : 286,
      "username" : "User 250",
      "createdAt" : "2015-09-28T10:15:58.011Z",
      "updatedAt" : "2015-09-28T10:15:58.011Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy53",
        "localId" : null
      }
    }
  }
]
```
