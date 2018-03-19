# Slots API

## High Five a Slot

### POST /v1/slots/:id/high_five

Current user High Five a slot.

### Parameters

Name : id *- required -*
Description : ID of the Slot to high_five

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=huN6NBC93hThuRPvxS76OXPcLro
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/30/high_five</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/30/high_five&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=huN6NBC93hThuRPvxS76OXPcLro&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 090ee3df-5e6a-477e-90b6-eaa433532edc
X-Runtime: 0.118141
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

