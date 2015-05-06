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

<pre>Authorization: Token token=5rnWbnMGeOV7i8YOkwGyQ6TkKvI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/48/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/48/comments&quot; -X GET \
	-H &quot;Authorization: Token token=5rnWbnMGeOV7i8YOkwGyQ6TkKvI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;bb9302ecf2c391cf67765de4e20833f8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 26920e74-59fd-4e36-ae78-eb89e3ae60e6
X-Runtime: 0.015222
Content-Length: 557</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>[
  {
    "createdAt" : "2015-05-06T11:28:51.628Z",
    "content" : "hate no one, love only a few",
    "userId" : 195,
    "username" : "User 195",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T11:28:51.635Z",
    "content" : "hate no one, love only a few",
    "userId" : 196,
    "username" : "User 196",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T11:28:51.639Z",
    "content" : "hate no one, love only a few",
    "userId" : 197,
    "username" : "User 197",
    "userimage" : null
  },
  {
    "createdAt" : "2015-05-06T11:28:51.666Z",
    "content" : "hate no one, love only a few",
    "userId" : 199,
    "username" : "User 199",
    "userimage" : "dfhjghjkdisudgfds7iy38"
  }
]</pre>
