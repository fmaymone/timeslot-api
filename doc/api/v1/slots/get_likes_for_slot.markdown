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

<pre>Authorization: Token token=7vwwzCJM3xMTBFVgYjHMpRlzNT8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/60/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/60/likes&quot; -X GET \
	-H &quot;Authorization: Token token=7vwwzCJM3xMTBFVgYjHMpRlzNT8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;171e1ab9aadf472c3dc2badb3936622f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 44deecaf-d08b-4c5d-9165-8ba24a0c6a1f
X-Runtime: 0.025235
Vary: Origin
Content-Length: 893</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-10-03T22:30:43.899Z",
    "liker" : {
      "id" : 282,
      "username" : "User 246",
      "createdAt" : "2015-10-03T22:30:43.896Z",
      "updatedAt" : "2015-10-03T22:30:43.896Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-03T22:30:43.904Z",
    "liker" : {
      "id" : 283,
      "username" : "User 247",
      "createdAt" : "2015-10-03T22:30:43.901Z",
      "updatedAt" : "2015-10-03T22:30:43.901Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-03T22:30:43.909Z",
    "liker" : {
      "id" : 284,
      "username" : "User 248",
      "createdAt" : "2015-10-03T22:30:43.906Z",
      "updatedAt" : "2015-10-03T22:30:43.906Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-03T22:30:43.932Z",
    "liker" : {
      "id" : 286,
      "username" : "User 250",
      "createdAt" : "2015-10-03T22:30:43.922Z",
      "updatedAt" : "2015-10-03T22:30:43.922Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy53",
        "localId" : null
      }
    }
  }
]
```
