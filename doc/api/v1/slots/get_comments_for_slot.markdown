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

<pre>Authorization: Token token=jrpnRfNHogxnMlFN4pnLi9UfVaA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/52/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/52/comments&quot; -X GET \
	-H &quot;Authorization: Token token=jrpnRfNHogxnMlFN4pnLi9UfVaA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;696c196ee10529508bef510252f38ed5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d57b04d2-5fc4-48e2-a806-544feac87eb8
X-Runtime: 0.029395
Content-Length: 1073</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-06-22T08:44:25.074Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 211,
      "username" : "User 208",
      "createdAt" : "2015-06-22T08:44:25.071Z",
      "updatedAt" : "2015-06-22T08:44:25.071Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-22T08:44:25.078Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 212,
      "username" : "User 209",
      "createdAt" : "2015-06-22T08:44:25.076Z",
      "updatedAt" : "2015-06-22T08:44:25.076Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-22T08:44:25.083Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 213,
      "username" : "User 210",
      "createdAt" : "2015-06-22T08:44:25.081Z",
      "updatedAt" : "2015-06-22T08:44:25.081Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-22T08:44:25.168Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 215,
      "username" : "User 212",
      "createdAt" : "2015-06-22T08:44:25.162Z",
      "updatedAt" : "2015-06-22T08:44:25.162Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy38",
        "localId" : null
      }
    }
  }
]
```
