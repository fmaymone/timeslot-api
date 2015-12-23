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
Authorization: Token token=qBzZ61gAaWwoD0bwUGR3yxtZ1tc
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/16/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/16/like&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=qBzZ61gAaWwoD0bwUGR3yxtZ1tc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 18b88f55-097b-4ee8-b579-cc811a39ca1f
X-Runtime: 0.042750
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

