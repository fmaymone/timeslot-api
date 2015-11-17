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
Authorization: Token token=ti7QG5HNDzSH_EeB18SqpeZH9jA
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/16/like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/16/like&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=ti7QG5HNDzSH_EeB18SqpeZH9jA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: a0ee71d8-48da-4b8b-b9f5-dc3a194afe29
X-Runtime: 0.013570
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

