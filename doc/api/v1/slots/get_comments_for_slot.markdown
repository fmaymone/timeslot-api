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

<pre>Authorization: Token token=3v7JeWglx-r7tDNvY1MESHffWME
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/51/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/51/comments&quot; -X GET \
	-H &quot;Authorization: Token token=3v7JeWglx-r7tDNvY1MESHffWME&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d400948a4e6c41ed29983d604915d161&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e5dc78f0-9813-4cf7-ba3d-6af6a671e218
X-Runtime: 0.017895
Content-Length: 961</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-06-03T10:39:39.701Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 255,
      "username" : "User 252",
      "createdAt" : "2015-06-03T10:39:39.698Z",
      "updatedAt" : "2015-06-03T10:39:39.698Z",
      "deletedAt" : null,
      "image" : null
    }
  },
  {
    "createdAt" : "2015-06-03T10:39:39.705Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 256,
      "username" : "User 253",
      "createdAt" : "2015-06-03T10:39:39.703Z",
      "updatedAt" : "2015-06-03T10:39:39.703Z",
      "deletedAt" : null,
      "image" : null
    }
  },
  {
    "createdAt" : "2015-06-03T10:39:39.711Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 257,
      "username" : "User 254",
      "createdAt" : "2015-06-03T10:39:39.708Z",
      "updatedAt" : "2015-06-03T10:39:39.708Z",
      "deletedAt" : null,
      "image" : null
    }
  },
  {
    "createdAt" : "2015-06-03T10:39:39.786Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 259,
      "username" : "User 256",
      "createdAt" : "2015-06-03T10:39:39.722Z",
      "updatedAt" : "2015-06-03T10:39:39.722Z",
      "deletedAt" : null,
      "image" : "dfhjghjkdisudgfds7iy38"
    }
  }
]
```
