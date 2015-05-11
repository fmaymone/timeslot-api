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

<pre>Authorization: Token token=a0C-4_WDQ6eeqE8IvbpE0ghQWCQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/46/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/46/likes&quot; -X GET \
	-H &quot;Authorization: Token token=a0C-4_WDQ6eeqE8IvbpE0ghQWCQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;6b213ca029d46f214a07f0cf10d225b0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7566468e-c6d0-4e42-a29b-9d30604c2a6e
X-Runtime: 0.019978
Content-Length: 393</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-05-06T21:29:37.990Z",
    "userId" : 182,
    "username" : "User 182",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T21:29:37.997Z",
    "userId" : 183,
    "username" : "User 183",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T21:29:38.001Z",
    "userId" : 184,
    "username" : "User 184",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T21:29:38.082Z",
    "userId" : 186,
    "username" : "User 186",
    "userimage" : "dfhjghjkdisudgfds7iy37"
  }
]
```
