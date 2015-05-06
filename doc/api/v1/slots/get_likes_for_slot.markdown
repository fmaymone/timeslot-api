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

<pre>Authorization: Token token=8T2aVele9_fLwhYd3cgzIr36aXY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/46/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/46/likes&quot; -X GET \
	-H &quot;Authorization: Token token=8T2aVele9_fLwhYd3cgzIr36aXY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;7691a3964e80d2138772210acc1db4dd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b3f1e4c1-dd81-48f3-875d-87df59e2c358
X-Runtime: 0.015614
Content-Length: 393</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>[
  {
    "createdAt" : "2015-05-06T14:45:16.926Z",
    "userId" : 182,
    "username" : "User 182",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T14:45:16.929Z",
    "userId" : 183,
    "username" : "User 183",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T14:45:16.935Z",
    "userId" : 184,
    "username" : "User 184",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T14:45:16.947Z",
    "userId" : 186,
    "username" : "User 186",
    "userimage" : "dfhjghjkdisudgfds7iy37"
  }
]</pre>
