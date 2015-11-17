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

<pre>Authorization: Token token=LsIZ6hX6J3aYF0oUssWbhhrW9ng
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/18/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/18/likes&quot; -X GET \
	-H &quot;Authorization: Token token=LsIZ6hX6J3aYF0oUssWbhhrW9ng&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;73da671b4e9f043de73e0359c5521209&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6308f542-06f2-4302-a618-1c0a111205f7
X-Runtime: 0.019430
Vary: Origin
Content-Length: 890</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-11-17T12:12:40.843Z",
    "liker" : {
      "id" : 43,
      "username" : "User 285",
      "createdAt" : "2015-11-17T12:12:40.839Z",
      "updatedAt" : "2015-11-17T12:12:40.839Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-11-17T12:12:40.848Z",
    "liker" : {
      "id" : 44,
      "username" : "User 286",
      "createdAt" : "2015-11-17T12:12:40.846Z",
      "updatedAt" : "2015-11-17T12:12:40.846Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-11-17T12:12:40.862Z",
    "liker" : {
      "id" : 45,
      "username" : "User 287",
      "createdAt" : "2015-11-17T12:12:40.857Z",
      "updatedAt" : "2015-11-17T12:12:40.857Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-11-17T12:12:40.889Z",
    "liker" : {
      "id" : 47,
      "username" : "User 289",
      "createdAt" : "2015-11-17T12:12:40.880Z",
      "updatedAt" : "2015-11-17T12:12:40.880Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy102",
        "localId" : null
      }
    }
  }
]
```
