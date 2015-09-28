# Slots API

## Unlike a Slot

### DELETE /v1/slots/:id/like

Current user unlikes a slot.

### Parameters

Name : id *- required -*
Description : ID of the Slot to like

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=RHXIe2jRcEt_L8eHIOfeWLbvwuQ
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/59/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/59/like&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=RHXIe2jRcEt_L8eHIOfeWLbvwuQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 0fa8577b-a94c-4f92-b962-013b3c6f8dcf
X-Runtime: 0.016738
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

