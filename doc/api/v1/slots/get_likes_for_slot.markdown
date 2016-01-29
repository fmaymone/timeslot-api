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

<pre>Authorization: Token token=OT92QRArpvaS4ZB-Fd3no0vq6TQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/22/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/22/likes&quot; -X GET \
	-H &quot;Authorization: Token token=OT92QRArpvaS4ZB-Fd3no0vq6TQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3a90275c919dcaf6dd139899196a2408&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7ad02e9e-da5d-4ee3-9809-7c1d4d3977b7
X-Runtime: 0.013163
Vary: Origin
Content-Length: 749</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2016-01-29T19:39:15.992Z",
    "liker" : {
      "id" : 65,
      "username" : "User 397",
      "createdAt" : "2016-01-29T19:39:15.988Z",
      "updatedAt" : "2016-01-29T19:39:15.988Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-29T19:39:15.999Z",
    "liker" : {
      "id" : 66,
      "username" : "User 398",
      "createdAt" : "2016-01-29T19:39:15.996Z",
      "updatedAt" : "2016-01-29T19:39:15.996Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-29T19:39:16.006Z",
    "liker" : {
      "id" : 67,
      "username" : "User 399",
      "createdAt" : "2016-01-29T19:39:16.003Z",
      "updatedAt" : "2016-01-29T19:39:16.003Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-29T19:39:16.010Z",
    "liker" : {
      "id" : 62,
      "username" : "User 394",
      "createdAt" : "2016-01-29T19:39:15.972Z",
      "updatedAt" : "2016-01-29T19:39:15.972Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
