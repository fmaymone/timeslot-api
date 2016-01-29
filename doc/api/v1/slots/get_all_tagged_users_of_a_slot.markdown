# Slots API

## Get all tagged users of a slot

### GET /v1/slots/:id/user_tags

returns a list of user ids which are tagged to this slot.

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
Authorization: Token token=Qs96SakBoCxZuuu5OKNxExc-93c
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/39/user_tags</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/39/user_tags&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Qs96SakBoCxZuuu5OKNxExc-93c&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d13ceda5b3f1e3998319e179f6c8b7a1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 19fd5aa0-b37a-41bc-9bad-9cd4d9670f7c
X-Runtime: 0.025274
Vary: Origin
Content-Length: 505</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 114,
    "username" : "User 450",
    "createdAt" : "2016-01-29T19:39:17.008Z",
    "updatedAt" : "2016-01-29T19:39:17.008Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 117,
    "username" : "User 453",
    "createdAt" : "2016-01-29T19:39:17.065Z",
    "updatedAt" : "2016-01-29T19:39:17.065Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 119,
    "username" : "User 455",
    "createdAt" : "2016-01-29T19:39:17.112Z",
    "updatedAt" : "2016-01-29T19:39:17.112Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
