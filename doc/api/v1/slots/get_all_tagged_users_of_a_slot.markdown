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
Authorization: Token token=1yBcn7FjUJ2FNxfTorDg6HpL1LE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/35/user_tags</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/slots/35/user_tags&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=1yBcn7FjUJ2FNxfTorDg6HpL1LE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;3a6b757b6574357d0914465e5f7e8f9b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e668b6c4-2319-4c29-88e9-2745fa589533
X-Runtime: 0.031636
Content-Length: 658</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
