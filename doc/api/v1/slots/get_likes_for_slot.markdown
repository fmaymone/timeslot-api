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

<pre>Authorization: Token token=X-e8isp8OqJ0ZoOu2RAS3ngK-KM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/18/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/18/likes&quot; -X GET \
	-H &quot;Authorization: Token token=X-e8isp8OqJ0ZoOu2RAS3ngK-KM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8d51503b76e24f0d828ac645c269d7cd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0e2fa060-ffdf-4b62-94ca-74ee1e8abb49
X-Runtime: 0.013660
Vary: Origin
Content-Length: 749</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-11-24T23:47:34.470Z",
    "liker" : {
      "id" : 43,
      "username" : "User 325",
      "createdAt" : "2015-11-24T23:47:34.467Z",
      "updatedAt" : "2015-11-24T23:47:34.467Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-24T23:47:34.475Z",
    "liker" : {
      "id" : 44,
      "username" : "User 326",
      "createdAt" : "2015-11-24T23:47:34.473Z",
      "updatedAt" : "2015-11-24T23:47:34.473Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-24T23:47:34.481Z",
    "liker" : {
      "id" : 45,
      "username" : "User 327",
      "createdAt" : "2015-11-24T23:47:34.478Z",
      "updatedAt" : "2015-11-24T23:47:34.478Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-24T23:47:34.501Z",
    "liker" : {
      "id" : 47,
      "username" : "User 329",
      "createdAt" : "2015-11-24T23:47:34.495Z",
      "updatedAt" : "2015-11-24T23:47:34.495Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
