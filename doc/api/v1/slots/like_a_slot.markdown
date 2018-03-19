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
Authorization: Token token=2rt2KgnBrNUyjuLzQfRXn-yxMGw
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/27/like</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/slots/27/like&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=2rt2KgnBrNUyjuLzQfRXn-yxMGw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 78f00a2e-2d74-4ebc-83d6-818e5c0aed5e
X-Runtime: 0.105587
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

