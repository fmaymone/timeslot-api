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
Authorization: Token token=YSkES-0L_Q_wNbHG0eim1xpgaAI
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/52/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/52/like&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=YSkES-0L_Q_wNbHG0eim1xpgaAI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: ed5c83e2-69ed-44f8-80e1-4c9a8e953e98
X-Runtime: 0.009431
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

