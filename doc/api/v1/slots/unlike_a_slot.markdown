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
Authorization: Token token=p7OhXlX6XBACligICvGyCiUA6_s
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/17/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/17/like&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=p7OhXlX6XBACligICvGyCiUA6_s&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 875df92a-a17f-4d23-9c00-af45a8bf72cc
X-Runtime: 0.017435
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

