# Slots API

## Get Likes for Slot

### GET /v1/slots/:id/likes

returns a list of all likes for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see Likes data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the likes for


### Response Fields

Name : array
Description : containing creation date of the Like and details of the user who made the Like

### Request

#### Headers

<pre>Authorization: Token token=ryRO-OnFnvvc5r9cnjsxW59Rjc0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/46/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/46/likes&quot; -X GET \
	-H &quot;Authorization: Token token=ryRO-OnFnvvc5r9cnjsxW59Rjc0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f7ccb60323f5cda2ad33235aa94d127d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ffd52d58-ab45-4ac2-80d9-b5dec349d655
X-Runtime: 0.020661
Content-Length: 393</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-05-22T15:50:02.618Z",
    "userId" : 193,
    "username" : "User 190",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-22T15:50:02.622Z",
    "userId" : 194,
    "username" : "User 191",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-22T15:50:02.626Z",
    "userId" : 195,
    "username" : "User 192",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-22T15:50:02.641Z",
    "userId" : 197,
    "username" : "User 194",
    "userimage" : "dfhjghjkdisudgfds7iy37"
  }
]
```
