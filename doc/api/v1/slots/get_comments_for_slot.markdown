# Slots API

## Get Comments for Slot

### GET /v1/slots/:id/comments

returns a list of all comments for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see Comments data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the comments for


### Response Fields

Name : array
Description : containing comment content and creation date and details of the user who made the comment

### Request

#### Headers

<pre>Authorization: Token token=HttItBj1eV8mSbNQOk4Q4AgjN-4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/20/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/20/comments&quot; -X GET \
	-H &quot;Authorization: Token token=HttItBj1eV8mSbNQOk4Q4AgjN-4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;82be41bc6c4f899bc4c5c2a9181beb59&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 119c7702-ea9a-42b0-8e07-2a20802de188
X-Runtime: 0.020304
Vary: Origin
Content-Length: 1070</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-11-17T12:12:40.988Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 57,
      "username" : "User 299",
      "createdAt" : "2015-11-17T12:12:40.985Z",
      "updatedAt" : "2015-11-17T12:12:40.985Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-11-17T12:12:40.994Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 58,
      "username" : "User 300",
      "createdAt" : "2015-11-17T12:12:40.991Z",
      "updatedAt" : "2015-11-17T12:12:40.991Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-11-17T12:12:40.999Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 59,
      "username" : "User 301",
      "createdAt" : "2015-11-17T12:12:40.997Z",
      "updatedAt" : "2015-11-17T12:12:40.997Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-11-17T12:12:41.022Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 61,
      "username" : "User 303",
      "createdAt" : "2015-11-17T12:12:41.014Z",
      "updatedAt" : "2015-11-17T12:12:41.014Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy103",
        "localId" : null
      }
    }
  }
]
```
