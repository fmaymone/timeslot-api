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
Authorization: Token token=zcAq5xxZmhvj8OU9hRZfTOtlhgM
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/26/like</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/26/like&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=zcAq5xxZmhvj8OU9hRZfTOtlhgM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 5ba763be-13b2-4eea-ba3f-0b3c857eda4d
X-Runtime: 0.025108
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

