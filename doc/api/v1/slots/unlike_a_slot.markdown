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
Authorization: Token token=P43CpltJVTotKFhWZ07YVk2fQKM
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/28/like</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/28/like&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=P43CpltJVTotKFhWZ07YVk2fQKM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: ad36ed1c-8d70-4bb6-8129-472c6f8b5ed2
X-Runtime: 0.073174
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

