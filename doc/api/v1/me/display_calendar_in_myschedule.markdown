# Me API

## Display Calendar in mySchedule

### POST /v1/me/schedule/calendar/:calendar_uuid

returns 200 if calendar was successfully added to schedule or has been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=-2BWbN2BzkeeAlqo0zvDj3BB1E8
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/me/schedule/calendar/f5f58d46-1638-4644-b668-3967fbf306c6</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/schedule/calendar/f5f58d46-1638-4644-b668-3967fbf306c6&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=-2BWbN2BzkeeAlqo0zvDj3BB1E8&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: f155b2be-ffe1-4c33-ab00-adeadb7ffa0a
X-Runtime: 0.050020
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

