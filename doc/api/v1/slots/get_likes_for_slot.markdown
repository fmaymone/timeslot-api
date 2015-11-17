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

<pre>Authorization: Token token=CpvO1NC7ylEd9aeTNCY1FLIJZdI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/18/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/18/likes&quot; -X GET \
	-H &quot;Authorization: Token token=CpvO1NC7ylEd9aeTNCY1FLIJZdI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7a7e73acfbe0502be716c5f9ba507384&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 965f5c13-63fb-4f9b-a130-2fbb8d7f4a43
X-Runtime: 0.025180
Vary: Origin
Content-Length: 749</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-11-17T23:46:16.195Z",
    "liker" : {
      "id" : 43,
      "username" : "User 320",
      "createdAt" : "2015-11-17T23:46:16.189Z",
      "updatedAt" : "2015-11-17T23:46:16.189Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-17T23:46:16.204Z",
    "liker" : {
      "id" : 44,
      "username" : "User 321",
      "createdAt" : "2015-11-17T23:46:16.200Z",
      "updatedAt" : "2015-11-17T23:46:16.200Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-17T23:46:16.214Z",
    "liker" : {
      "id" : 45,
      "username" : "User 322",
      "createdAt" : "2015-11-17T23:46:16.208Z",
      "updatedAt" : "2015-11-17T23:46:16.208Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-17T23:46:16.241Z",
    "liker" : {
      "id" : 47,
      "username" : "User 324",
      "createdAt" : "2015-11-17T23:46:16.236Z",
      "updatedAt" : "2015-11-17T23:46:16.236Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
