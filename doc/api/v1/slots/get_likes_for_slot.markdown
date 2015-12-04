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

<pre>Authorization: Token token=3d8ZrG5457qzv3Gz0j3E6EblpnE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/18/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/18/likes&quot; -X GET \
	-H &quot;Authorization: Token token=3d8ZrG5457qzv3Gz0j3E6EblpnE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1fcc5e0ad52fa7351d6e1c74dbf3e522&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 203649ad-39a4-48d3-9987-77f27ae39c26
X-Runtime: 0.012858
Vary: Origin
Content-Length: 749</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-12-04T16:56:53.116Z",
    "liker" : {
      "id" : 43,
      "username" : "User 327",
      "createdAt" : "2015-12-04T16:56:53.099Z",
      "updatedAt" : "2015-12-04T16:56:53.099Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-04T16:56:53.124Z",
    "liker" : {
      "id" : 44,
      "username" : "User 328",
      "createdAt" : "2015-12-04T16:56:53.121Z",
      "updatedAt" : "2015-12-04T16:56:53.121Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-04T16:56:53.129Z",
    "liker" : {
      "id" : 45,
      "username" : "User 329",
      "createdAt" : "2015-12-04T16:56:53.127Z",
      "updatedAt" : "2015-12-04T16:56:53.127Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-04T16:56:53.147Z",
    "liker" : {
      "id" : 47,
      "username" : "User 331",
      "createdAt" : "2015-12-04T16:56:53.145Z",
      "updatedAt" : "2015-12-04T16:56:53.145Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
