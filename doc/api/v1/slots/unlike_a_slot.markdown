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
Authorization: Token token=P6IdOuo7VNQQP6htIWpRKuI6hoM
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/17/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/17/like&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=P6IdOuo7VNQQP6htIWpRKuI6hoM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: cb8adc9a-71f5-4325-909f-e46782c0b6bc
X-Runtime: 0.009761
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

