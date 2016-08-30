# Slots API

## Unlike a Slot

### DELETE /v1/slots/:id/like

Current user unlikes a slot.

### Parameters

Name : id *- required -*
Description : ID of the Slot to unlike

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=9MNHX2wK9HlFFZpbZXyvfYtsd4I
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/29/like</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/29/like&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=9MNHX2wK9HlFFZpbZXyvfYtsd4I&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 231e4654-460b-4050-9f70-6def460d62db
X-Runtime: 0.033454
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

