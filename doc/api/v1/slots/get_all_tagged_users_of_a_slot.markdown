# Slots API

## Get all tagged users of a slot

### GET /v1/slots/:id/user_tags

returns a list of user ids which was tagged to this slot.

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the user tags for


### Response Fields

Name : array
Description : containing a list of users

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=JVTPWr32FqSEJJ4n1PmjPEEGjIo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/35/user_tags</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/35/user_tags&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=JVTPWr32FqSEJJ4n1PmjPEEGjIo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;fe5e3533784983679d476c5726dd7d84&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 44384d39-7485-4421-bee8-766a0ca6aa4c
X-Runtime: 0.017034
Vary: Origin
Content-Length: 502</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 94,
    "username" : "User 389",
    "createdAt" : "2015-12-29T10:15:16.226Z",
    "updatedAt" : "2015-12-29T10:15:16.226Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 97,
    "username" : "User 392",
    "createdAt" : "2015-12-29T10:15:16.287Z",
    "updatedAt" : "2015-12-29T10:15:16.287Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 99,
    "username" : "User 394",
    "createdAt" : "2015-12-29T10:15:16.341Z",
    "updatedAt" : "2015-12-29T10:15:16.341Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
