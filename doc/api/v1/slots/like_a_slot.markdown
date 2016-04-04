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
Authorization: Token token=GIRgfekWHTiWGcdpPER0N11n5AU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/25/like</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/25/like&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=GIRgfekWHTiWGcdpPER0N11n5AU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 3f89f60d-7931-4166-ae14-5a3fa035e492
X-Runtime: 0.037076
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

