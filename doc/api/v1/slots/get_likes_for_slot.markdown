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

<pre>Authorization: Token token=nw0-41wP9hYaEmG8WICTrb1UXoU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/18/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/18/likes&quot; -X GET \
	-H &quot;Authorization: Token token=nw0-41wP9hYaEmG8WICTrb1UXoU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;fabb0e18c5d14e81142a766ab4505cf8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c61ad821-148b-4846-a8c6-47c42bf5df49
X-Runtime: 0.019543
Vary: Origin
Content-Length: 889</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-10-30T15:01:05.324Z",
    "liker" : {
      "id" : 43,
      "username" : "User 261",
      "createdAt" : "2015-10-30T15:01:05.321Z",
      "updatedAt" : "2015-10-30T15:01:05.321Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-30T15:01:05.328Z",
    "liker" : {
      "id" : 44,
      "username" : "User 262",
      "createdAt" : "2015-10-30T15:01:05.326Z",
      "updatedAt" : "2015-10-30T15:01:05.326Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-30T15:01:05.333Z",
    "liker" : {
      "id" : 45,
      "username" : "User 263",
      "createdAt" : "2015-10-30T15:01:05.330Z",
      "updatedAt" : "2015-10-30T15:01:05.330Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-30T15:01:05.353Z",
    "liker" : {
      "id" : 47,
      "username" : "User 265",
      "createdAt" : "2015-10-30T15:01:05.345Z",
      "updatedAt" : "2015-10-30T15:01:05.345Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy78",
        "localId" : null
      }
    }
  }
]
```
