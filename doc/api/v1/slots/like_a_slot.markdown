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
Authorization: Token token=Yv0QTOEBpu4A5o7pPDyOZuNdEpU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/15/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/15/like&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Yv0QTOEBpu4A5o7pPDyOZuNdEpU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 0e6a4f37-3beb-462f-b03a-8234bf49a993
X-Runtime: 0.041111
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

