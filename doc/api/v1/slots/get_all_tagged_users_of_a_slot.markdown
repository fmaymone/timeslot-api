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
Authorization: Token token=7Dmq6MxkFlae2iVwOt9e4rZrgY8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/32/user_tags</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/32/user_tags&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=7Dmq6MxkFlae2iVwOt9e4rZrgY8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;577a0b9f37e620ac903d50889e493932&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 08baefe8-a043-45cf-93ef-834480dfcad3
X-Runtime: 0.014991
Vary: Origin
Content-Length: 505</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 105,
    "username" : "User 407",
    "createdAt" : "2016-04-04T20:50:33.144Z",
    "updatedAt" : "2016-04-04T20:50:33.144Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 106,
    "username" : "User 408",
    "createdAt" : "2016-04-04T20:50:33.149Z",
    "updatedAt" : "2016-04-04T20:50:33.149Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 107,
    "username" : "User 409",
    "createdAt" : "2016-04-04T20:50:33.153Z",
    "updatedAt" : "2016-04-04T20:50:33.153Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
