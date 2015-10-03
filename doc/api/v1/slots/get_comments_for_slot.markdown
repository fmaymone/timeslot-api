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

<pre>Authorization: Token token=EUTy_Q0j9KRFUUuSCtsuiXL_F2M
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/62/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/62/comments&quot; -X GET \
	-H &quot;Authorization: Token token=EUTy_Q0j9KRFUUuSCtsuiXL_F2M&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;068853513100f445dccf45804af3f9ea&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 892a715c-c625-49e1-b73a-ea66b90a8c49
X-Runtime: 0.033797
Vary: Origin
Content-Length: 1073</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-09-28T10:15:58.271Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 296,
      "username" : "User 260",
      "createdAt" : "2015-09-28T10:15:58.268Z",
      "updatedAt" : "2015-09-28T10:15:58.268Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-28T10:15:58.277Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 297,
      "username" : "User 261",
      "createdAt" : "2015-09-28T10:15:58.274Z",
      "updatedAt" : "2015-09-28T10:15:58.274Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-28T10:15:58.283Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 298,
      "username" : "User 262",
      "createdAt" : "2015-09-28T10:15:58.280Z",
      "updatedAt" : "2015-09-28T10:15:58.280Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-28T10:15:58.374Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 300,
      "username" : "User 264",
      "createdAt" : "2015-09-28T10:15:58.365Z",
      "updatedAt" : "2015-09-28T10:15:58.365Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy54",
        "localId" : null
      }
    }
  }
]
```
