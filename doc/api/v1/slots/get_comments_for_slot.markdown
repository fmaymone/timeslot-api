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

<pre>Authorization: Token token=9YPkclipbLAjMw6bFe7YlCkpzO4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/62/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/62/comments&quot; -X GET \
	-H &quot;Authorization: Token token=9YPkclipbLAjMw6bFe7YlCkpzO4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ba817a6c8a0af806c59fcee3258e714f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1a3da426-7641-4a30-9e01-d9e15edf2e2c
X-Runtime: 0.036139
Vary: Origin
Content-Length: 1073</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-10-03T22:30:44.054Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 296,
      "username" : "User 260",
      "createdAt" : "2015-10-03T22:30:44.051Z",
      "updatedAt" : "2015-10-03T22:30:44.051Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-03T22:30:44.059Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 297,
      "username" : "User 261",
      "createdAt" : "2015-10-03T22:30:44.056Z",
      "updatedAt" : "2015-10-03T22:30:44.056Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-03T22:30:44.064Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 298,
      "username" : "User 262",
      "createdAt" : "2015-10-03T22:30:44.061Z",
      "updatedAt" : "2015-10-03T22:30:44.061Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-03T22:30:44.092Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 300,
      "username" : "User 264",
      "createdAt" : "2015-10-03T22:30:44.076Z",
      "updatedAt" : "2015-10-03T22:30:44.076Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy54",
        "localId" : null
      }
    }
  }
]
```
