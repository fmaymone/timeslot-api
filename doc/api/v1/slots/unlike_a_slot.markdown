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
Authorization: Token token=OeZP-Oq1NfD2-1mtpm-gnV5flkk
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/57/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/57/like&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=OeZP-Oq1NfD2-1mtpm-gnV5flkk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 453dc36a-3c01-41f8-8d61-b058f3fb90c5
X-Runtime: 0.041880
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

