# Me API

## Hide Calendar from mySchedule

### DELETE /v1/me/schedule/calendar/:calendar_uuid

returns 200 if calendar successfully removed from schedule or hasn&#39;t been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=m8cXHcpOm4y34ZocdQarFtU74Sc
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me/schedule/calendar/e093bf98-fc46-4c3a-8720-1677573b104a</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/schedule/calendar/e093bf98-fc46-4c3a-8720-1677573b104a&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=m8cXHcpOm4y34ZocdQarFtU74Sc&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 3b6941e8-faab-4e67-9260-a6c39c8b4f3c
X-Runtime: 0.044734
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

