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

<pre>Authorization: Token token=etimA6OBSesucXD3UCYEXyrNuuE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/20/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/20/comments&quot; -X GET \
	-H &quot;Authorization: Token token=etimA6OBSesucXD3UCYEXyrNuuE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b28b885be5db05f7a44026bc790c1b6b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3f6d132b-e6b9-4572-89f5-a1dae2e783bb
X-Runtime: 0.018028
Vary: Origin
Content-Length: 929</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-12-23T11:18:35.683Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 56,
      "username" : "User 347",
      "createdAt" : "2015-12-23T11:18:35.681Z",
      "updatedAt" : "2015-12-23T11:18:35.681Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-23T11:18:35.689Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 57,
      "username" : "User 348",
      "createdAt" : "2015-12-23T11:18:35.687Z",
      "updatedAt" : "2015-12-23T11:18:35.687Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-23T11:18:35.695Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 58,
      "username" : "User 349",
      "createdAt" : "2015-12-23T11:18:35.692Z",
      "updatedAt" : "2015-12-23T11:18:35.692Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-23T11:18:35.711Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 60,
      "username" : "User 351",
      "createdAt" : "2015-12-23T11:18:35.708Z",
      "updatedAt" : "2015-12-23T11:18:35.708Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
