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

<pre>Authorization: Token token=YkgaHGHerLvWzOaq2q6A7q8SuXM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/20/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/20/comments&quot; -X GET \
	-H &quot;Authorization: Token token=YkgaHGHerLvWzOaq2q6A7q8SuXM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;879dc3ffd4f4eb509e86dbadeee4412a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7b7521fa-4a47-43a3-94fa-3169653ceb25
X-Runtime: 0.021584
Vary: Origin
Content-Length: 1069</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-10-30T15:01:05.449Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 57,
      "username" : "User 275",
      "createdAt" : "2015-10-30T15:01:05.447Z",
      "updatedAt" : "2015-10-30T15:01:05.447Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-30T15:01:05.454Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 58,
      "username" : "User 276",
      "createdAt" : "2015-10-30T15:01:05.452Z",
      "updatedAt" : "2015-10-30T15:01:05.452Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-30T15:01:05.459Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 59,
      "username" : "User 277",
      "createdAt" : "2015-10-30T15:01:05.457Z",
      "updatedAt" : "2015-10-30T15:01:05.457Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-30T15:01:05.479Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 61,
      "username" : "User 279",
      "createdAt" : "2015-10-30T15:01:05.470Z",
      "updatedAt" : "2015-10-30T15:01:05.470Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy79",
        "localId" : null
      }
    }
  }
]
```
