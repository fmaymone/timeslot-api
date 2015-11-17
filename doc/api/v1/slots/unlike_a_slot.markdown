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
Authorization: Token token=fM9nQVPRMsxiQvat9ghsdT7CJsg
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/17/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/17/like&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=fM9nQVPRMsxiQvat9ghsdT7CJsg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: bc1c2dbb-62a0-4a91-a4ed-7f86006d8b7f
X-Runtime: 0.009259
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

