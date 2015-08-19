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
Authorization: Token token=41O-5R6VS4GsC7o5y0htPrsChCs
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/53/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/53/like&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=41O-5R6VS4GsC7o5y0htPrsChCs&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 11246ae4-8573-437f-aeee-4975f5ea96e6
X-Runtime: 0.010897
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

