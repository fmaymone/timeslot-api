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
Authorization: Token token=h5a_kssEKwjQjRE0gidooG-dZhM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/27/like</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/27/like&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=h5a_kssEKwjQjRE0gidooG-dZhM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: fccb4a24-a09f-4cdd-a8fb-2ed10c36e240
X-Runtime: 0.091239
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

