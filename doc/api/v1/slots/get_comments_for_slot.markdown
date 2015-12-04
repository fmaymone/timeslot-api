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

<pre>Authorization: Token token=0pXtvk5UOMbaexAXmPsQXwzyi1w
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/20/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/20/comments&quot; -X GET \
	-H &quot;Authorization: Token token=0pXtvk5UOMbaexAXmPsQXwzyi1w&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;33b2aedab4ab56fcfbf6e0ccc1f1d8c4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0c3d2300-7d21-4ccd-9abc-dbfd47c183ee
X-Runtime: 0.016746
Vary: Origin
Content-Length: 929</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-12-04T16:56:53.267Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 56,
      "username" : "User 340",
      "createdAt" : "2015-12-04T16:56:53.265Z",
      "updatedAt" : "2015-12-04T16:56:53.265Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-04T16:56:53.273Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 57,
      "username" : "User 341",
      "createdAt" : "2015-12-04T16:56:53.271Z",
      "updatedAt" : "2015-12-04T16:56:53.271Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-04T16:56:53.284Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 58,
      "username" : "User 342",
      "createdAt" : "2015-12-04T16:56:53.277Z",
      "updatedAt" : "2015-12-04T16:56:53.277Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-04T16:56:53.299Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 60,
      "username" : "User 344",
      "createdAt" : "2015-12-04T16:56:53.296Z",
      "updatedAt" : "2015-12-04T16:56:53.296Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
