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

<pre>Authorization: Token token=ouXyyPg4dL-6W2fKdMPM18vvmzw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/24/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/24/comments&quot; -X GET \
	-H &quot;Authorization: Token token=ouXyyPg4dL-6W2fKdMPM18vvmzw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;db519d23d50e97593ba4c2cedd307e89&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8cd4729f-8da2-46e7-a629-64db6d86bddc
X-Runtime: 0.012074
Vary: Origin
Content-Length: 697</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2016-01-29T19:39:16.173Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 77,
      "username" : "User 409",
      "createdAt" : "2016-01-29T19:39:16.170Z",
      "updatedAt" : "2016-01-29T19:39:16.170Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-29T19:39:16.196Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 78,
      "username" : "User 410",
      "createdAt" : "2016-01-29T19:39:16.177Z",
      "updatedAt" : "2016-01-29T19:39:16.177Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-29T19:39:16.203Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 79,
      "username" : "User 411",
      "createdAt" : "2016-01-29T19:39:16.199Z",
      "updatedAt" : "2016-01-29T19:39:16.199Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
