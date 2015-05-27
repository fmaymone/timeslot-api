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

<pre>Authorization: Token token=VuD5kGZBlpQoeZlqETyCfzrpzAs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/48/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/48/comments&quot; -X GET \
	-H &quot;Authorization: Token token=VuD5kGZBlpQoeZlqETyCfzrpzAs&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3e81e36a2b9c22683c0c143b9c393160&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4b2796a0-1203-4425-934b-aa114ee271bd
X-Runtime: 0.015677
Content-Length: 557</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-05-22T15:50:02.747Z",
    "content" : "hate no one, love only a few",
    "userId" : 206,
    "username" : "User 203",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-22T15:50:02.751Z",
    "content" : "hate no one, love only a few",
    "userId" : 207,
    "username" : "User 204",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-22T15:50:02.756Z",
    "content" : "hate no one, love only a few",
    "userId" : 208,
    "username" : "User 205",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-22T15:50:02.774Z",
    "content" : "hate no one, love only a few",
    "userId" : 210,
    "username" : "User 207",
    "userimage" : "dfhjghjkdisudgfds7iy38"
  }
]
```
