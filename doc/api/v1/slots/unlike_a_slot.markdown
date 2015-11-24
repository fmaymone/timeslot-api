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
Authorization: Token token=-S4HqwgLfeJ2leVTJVg177vhNT8
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/17/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/17/like&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=-S4HqwgLfeJ2leVTJVg177vhNT8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 7274385c-e257-411f-8285-33f92fce3a70
X-Runtime: 0.011463
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

