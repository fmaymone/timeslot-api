# Slots API

## Like a Slot

### POST /v1/slots/:id/like

Current user likes a slot.

### Parameters

Name : id *- required -*
Description : ID of the Slot to like

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=KsuDT5ATkTWMuD47HQjlUJ9_DOQ
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/16/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/16/like&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=KsuDT5ATkTWMuD47HQjlUJ9_DOQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: e6ab712b-34bc-4cce-8455-11b096ab7b1a
X-Runtime: 0.029296
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

