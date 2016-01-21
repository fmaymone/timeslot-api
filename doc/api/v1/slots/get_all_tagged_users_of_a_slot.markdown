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
Authorization: Token token=bREzMdMkFPPMg2m0yDcFj0HNRuA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/34/user_tags</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/34/user_tags&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=bREzMdMkFPPMg2m0yDcFj0HNRuA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;956f7afac98711775346ebecabf4a2e6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8e476a40-82b2-45b6-bb46-6af991d29fde
X-Runtime: 0.015580
Vary: Origin
Content-Length: 502</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 94,
    "username" : "User 397",
    "createdAt" : "2016-01-21T23:11:42.200Z",
    "updatedAt" : "2016-01-21T23:11:42.200Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 97,
    "username" : "User 400",
    "createdAt" : "2016-01-21T23:11:42.248Z",
    "updatedAt" : "2016-01-21T23:11:42.248Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 99,
    "username" : "User 402",
    "createdAt" : "2016-01-21T23:11:42.283Z",
    "updatedAt" : "2016-01-21T23:11:42.283Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
