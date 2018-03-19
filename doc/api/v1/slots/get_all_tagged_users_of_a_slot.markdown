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
Authorization: Token token=1V0qqh_86v-6R6bu51vOSlJYpP4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/35/user_tags</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/35/user_tags&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=1V0qqh_86v-6R6bu51vOSlJYpP4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;35b03c42002066168f5684b7a0d7cd88&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2722ad13-e836-4f65-b434-1d769d492e09
X-Runtime: 0.033281
Content-Length: 658</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
