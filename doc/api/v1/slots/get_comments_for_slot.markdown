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

<pre>Authorization: Token token=fDlXsQH30rp2b_ufLNVQ29d4nME
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/20/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/20/comments&quot; -X GET \
	-H &quot;Authorization: Token token=fDlXsQH30rp2b_ufLNVQ29d4nME&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;989ef0e31bf364a9dab5473ef2578e41&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6ea043ba-375e-4a38-bcf6-722341e0a74b
X-Runtime: 0.018769
Vary: Origin
Content-Length: 929</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-11-17T23:46:16.438Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 56,
      "username" : "User 333",
      "createdAt" : "2015-11-17T23:46:16.433Z",
      "updatedAt" : "2015-11-17T23:46:16.433Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-17T23:46:16.447Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 57,
      "username" : "User 334",
      "createdAt" : "2015-11-17T23:46:16.442Z",
      "updatedAt" : "2015-11-17T23:46:16.442Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-17T23:46:16.454Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 58,
      "username" : "User 335",
      "createdAt" : "2015-11-17T23:46:16.450Z",
      "updatedAt" : "2015-11-17T23:46:16.450Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-17T23:46:16.475Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 60,
      "username" : "User 337",
      "createdAt" : "2015-11-17T23:46:16.470Z",
      "updatedAt" : "2015-11-17T23:46:16.470Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
