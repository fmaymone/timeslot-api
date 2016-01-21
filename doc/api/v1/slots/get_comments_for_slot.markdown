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

<pre>Authorization: Token token=50TBhLPM4E034pDdq1vm0GN2oyE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/19/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/19/comments&quot; -X GET \
	-H &quot;Authorization: Token token=50TBhLPM4E034pDdq1vm0GN2oyE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;582f183a0d253fbaccd506300d1e6809&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b1393e95-9ca0-4d95-b6f6-d4f65efa99c2
X-Runtime: 0.010328
Vary: Origin
Content-Length: 697</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2016-01-21T23:11:41.655Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 57,
      "username" : "User 356",
      "createdAt" : "2016-01-21T23:11:41.641Z",
      "updatedAt" : "2016-01-21T23:11:41.641Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-21T23:11:41.661Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 58,
      "username" : "User 357",
      "createdAt" : "2016-01-21T23:11:41.659Z",
      "updatedAt" : "2016-01-21T23:11:41.659Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-21T23:11:41.666Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 59,
      "username" : "User 358",
      "createdAt" : "2016-01-21T23:11:41.663Z",
      "updatedAt" : "2016-01-21T23:11:41.663Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
