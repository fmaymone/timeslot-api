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

<pre>Authorization: Token token=bYWIcheutwDE9p4QZOVrAVHFXO8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/60/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/60/comments&quot; -X GET \
	-H &quot;Authorization: Token token=bYWIcheutwDE9p4QZOVrAVHFXO8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c3783727858c870e794f235995bf85cd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ff6efdb7-3dca-468e-8d51-9818d604781d
X-Runtime: 0.033178
Vary: Origin
Content-Length: 1073</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-09-14T10:32:58.179Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 293,
      "username" : "User 259",
      "createdAt" : "2015-09-14T10:32:58.176Z",
      "updatedAt" : "2015-09-14T10:32:58.176Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-14T10:32:58.184Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 294,
      "username" : "User 260",
      "createdAt" : "2015-09-14T10:32:58.181Z",
      "updatedAt" : "2015-09-14T10:32:58.181Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-14T10:32:58.190Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 295,
      "username" : "User 261",
      "createdAt" : "2015-09-14T10:32:58.187Z",
      "updatedAt" : "2015-09-14T10:32:58.187Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-14T10:32:58.280Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 297,
      "username" : "User 263",
      "createdAt" : "2015-09-14T10:32:58.270Z",
      "updatedAt" : "2015-09-14T10:32:58.270Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy54",
        "localId" : null
      }
    }
  }
]
```
