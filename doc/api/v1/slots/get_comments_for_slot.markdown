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

<pre>Authorization: Token token=RUaSxK8i29cMUjKUkkCe4HAPIZM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/52/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/52/comments&quot; -X GET \
	-H &quot;Authorization: Token token=RUaSxK8i29cMUjKUkkCe4HAPIZM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9950e4c3c656190dce42cc256b549f89&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 152f49ef-aaad-4ee2-b2a1-7615d7a58c23
X-Runtime: 0.027861
Content-Length: 1073</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-07-02T12:34:20.481Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 223,
      "username" : "User 208",
      "createdAt" : "2015-07-02T12:34:20.477Z",
      "updatedAt" : "2015-07-02T12:34:20.477Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-07-02T12:34:20.497Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 224,
      "username" : "User 209",
      "createdAt" : "2015-07-02T12:34:20.494Z",
      "updatedAt" : "2015-07-02T12:34:20.494Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-07-02T12:34:20.504Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 225,
      "username" : "User 210",
      "createdAt" : "2015-07-02T12:34:20.500Z",
      "updatedAt" : "2015-07-02T12:34:20.500Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-07-02T12:34:20.524Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 227,
      "username" : "User 212",
      "createdAt" : "2015-07-02T12:34:20.517Z",
      "updatedAt" : "2015-07-02T12:34:20.517Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy38",
        "localId" : null
      }
    }
  }
]
```
