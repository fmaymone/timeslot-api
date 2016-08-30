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
Authorization: Token token=oWkMj-3ALyU8O9m3b3dR66lIsUc
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/28/like</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/28/like&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=oWkMj-3ALyU8O9m3b3dR66lIsUc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 1ca84969-5d7c-48cc-aa41-2a10f87dfd62
X-Runtime: 0.069023
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

