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

<pre>Authorization: Token token=RpXxTsLKBque-1vBaahNKQRwOsI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/51/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/51/comments&quot; -X GET \
	-H &quot;Authorization: Token token=RpXxTsLKBque-1vBaahNKQRwOsI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d7e0ea3333f26fd31a304c4fd83b5629&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f9e0cb4b-2983-4135-8ee9-2bd86423400a
X-Runtime: 0.035013
Content-Length: 1061</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-06-11T16:20:56.138Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 209,
      "username" : "User 206",
      "createdAt" : "2015-06-11T16:20:56.135Z",
      "updatedAt" : "2015-06-11T16:20:56.135Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-11T16:20:56.145Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 210,
      "username" : "User 207",
      "createdAt" : "2015-06-11T16:20:56.142Z",
      "updatedAt" : "2015-06-11T16:20:56.142Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-11T16:20:56.150Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 211,
      "username" : "User 208",
      "createdAt" : "2015-06-11T16:20:56.147Z",
      "updatedAt" : "2015-06-11T16:20:56.147Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-11T16:20:56.240Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 213,
      "username" : "User 210",
      "createdAt" : "2015-06-11T16:20:56.233Z",
      "updatedAt" : "2015-06-11T16:20:56.233Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : "dfhjghjkdisudgfds7iy38",
        "localId" : null
      }
    }
  }
]
```
