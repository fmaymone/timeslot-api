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

<pre>Authorization: Token token=QglY-nFAuynQNrnhy6elTRDHzcc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/48/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/48/comments&quot; -X GET \
	-H &quot;Authorization: Token token=QglY-nFAuynQNrnhy6elTRDHzcc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;7b208f0a1d19c56939f6b98eb416a615&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 545fa085-60bd-4174-b331-6ef4425c8a73
X-Runtime: 0.019737
Content-Length: 557</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-05-06T21:29:38.238Z",
    "content" : "hate no one, love only a few",
    "userId" : 195,
    "username" : "User 195",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T21:29:38.245Z",
    "content" : "hate no one, love only a few",
    "userId" : 196,
    "username" : "User 196",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T21:29:38.251Z",
    "content" : "hate no one, love only a few",
    "userId" : 197,
    "username" : "User 197",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T21:29:38.333Z",
    "content" : "hate no one, love only a few",
    "userId" : 199,
    "username" : "User 199",
    "userimage" : "dfhjghjkdisudgfds7iy38"
  }
]
```
