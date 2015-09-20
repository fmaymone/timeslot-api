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

<pre>Authorization: Token token=1M5zkb0o1Yjb9CseQ1b94u0kQUc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/62/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/62/comments&quot; -X GET \
	-H &quot;Authorization: Token token=1M5zkb0o1Yjb9CseQ1b94u0kQUc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5ec4a200c0c506ab42c2e219dc200fe4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: baad1f30-12be-47b3-8509-e4546418ebb9
X-Runtime: 0.034517
Vary: Origin
Content-Length: 1073</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-09-20T18:49:37.679Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 296,
      "username" : "User 260",
      "createdAt" : "2015-09-20T18:49:37.673Z",
      "updatedAt" : "2015-09-20T18:49:37.673Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-20T18:49:37.685Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 297,
      "username" : "User 261",
      "createdAt" : "2015-09-20T18:49:37.682Z",
      "updatedAt" : "2015-09-20T18:49:37.682Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-20T18:49:37.689Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 298,
      "username" : "User 262",
      "createdAt" : "2015-09-20T18:49:37.687Z",
      "updatedAt" : "2015-09-20T18:49:37.687Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-20T18:49:37.778Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 300,
      "username" : "User 264",
      "createdAt" : "2015-09-20T18:49:37.769Z",
      "updatedAt" : "2015-09-20T18:49:37.769Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy54",
        "localId" : null
      }
    }
  }
]
```
