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
Authorization: Token token=CEcGXHLSxf-4xufXFIcN7X1abSw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/35/user_tags</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/35/user_tags&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=CEcGXHLSxf-4xufXFIcN7X1abSw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;6e8c278b83108a34bdbae1f6dff4566c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dbd143cd-fa81-447b-9e43-8c9d16328859
X-Runtime: 0.014684
Content-Length: 655</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 97,
    "username" : "User 816",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:10.596Z",
    "updatedAt" : "2016-08-30T09:51:10.596Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 98,
    "username" : "User 817",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:10.601Z",
    "updatedAt" : "2016-08-30T09:51:10.601Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 99,
    "username" : "User 818",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:10.606Z",
    "updatedAt" : "2016-08-30T09:51:10.606Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
