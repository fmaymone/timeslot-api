# Slots API

## Get Likes for Slot

### GET /v1/slots/:id/likes

returns a list of all likes for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see Likes data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the likes for

### Request

#### Headers

<pre>Authorization: Token token=jaN6NhYxX3LEK7NMtzbGlqFlptM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/46/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/46/likes&quot; -X GET \
	-H &quot;Authorization: Token token=jaN6NhYxX3LEK7NMtzbGlqFlptM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;53bdb01d9b2b965f2c8a9802362b1d92&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8dd45e68-7f2a-4024-8e6d-e56348d2ee03
X-Runtime: 0.019193
Content-Length: 393</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-05-19T10:51:51.569Z",
    "userId" : 192,
    "username" : "User 189",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-19T10:51:51.574Z",
    "userId" : 193,
    "username" : "User 190",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-19T10:51:51.578Z",
    "userId" : 194,
    "username" : "User 191",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-19T10:51:51.594Z",
    "userId" : 196,
    "username" : "User 193",
    "userimage" : "dfhjghjkdisudgfds7iy37"
  }
]
```
