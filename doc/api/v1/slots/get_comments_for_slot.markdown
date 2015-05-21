# Slots API

## Get Comments for Slot

### GET /v1/slots/:id/comments

returns a list of all comments for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see Comments data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the comments for

### Request

#### Headers

<pre>Authorization: Token token=PeU5jGHU_qpt6pu96VIbjHXaymw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/48/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/48/comments&quot; -X GET \
	-H &quot;Authorization: Token token=PeU5jGHU_qpt6pu96VIbjHXaymw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0e90c39979b6d83605d41409ca9fde4d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c3ad1bec-e147-445b-8d2b-48f85b5b4e72
X-Runtime: 0.015173
Content-Length: 557</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-05-19T10:51:51.698Z",
    "content" : "hate no one, love only a few",
    "userId" : 205,
    "username" : "User 202",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-19T10:51:51.702Z",
    "content" : "hate no one, love only a few",
    "userId" : 206,
    "username" : "User 203",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-19T10:51:51.707Z",
    "content" : "hate no one, love only a few",
    "userId" : 207,
    "username" : "User 204",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-19T10:51:51.726Z",
    "content" : "hate no one, love only a few",
    "userId" : 209,
    "username" : "User 206",
    "userimage" : "dfhjghjkdisudgfds7iy38"
  }
]
```
