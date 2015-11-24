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

<pre>Authorization: Token token=I9_o9s0lxwKqOjDIhubqCnyfeQE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/20/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/20/comments&quot; -X GET \
	-H &quot;Authorization: Token token=I9_o9s0lxwKqOjDIhubqCnyfeQE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c372672749a21804f7fd7b2d926bb6d6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9deff5d0-8026-4e7b-864b-6cb461ba8ce7
X-Runtime: 0.017458
Vary: Origin
Content-Length: 929</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-11-24T23:47:34.629Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 56,
      "username" : "User 338",
      "createdAt" : "2015-11-24T23:47:34.626Z",
      "updatedAt" : "2015-11-24T23:47:34.626Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-24T23:47:34.634Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 57,
      "username" : "User 339",
      "createdAt" : "2015-11-24T23:47:34.632Z",
      "updatedAt" : "2015-11-24T23:47:34.632Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-24T23:47:34.639Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 58,
      "username" : "User 340",
      "createdAt" : "2015-11-24T23:47:34.637Z",
      "updatedAt" : "2015-11-24T23:47:34.637Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-24T23:47:34.654Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 60,
      "username" : "User 342",
      "createdAt" : "2015-11-24T23:47:34.651Z",
      "updatedAt" : "2015-11-24T23:47:34.651Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
