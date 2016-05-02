# Me API

## Hide Calendar from mySchedule

### DELETE /v1/me/schedule/calendar/:calendar_uuid

returns 200 if calendar successfully removed from schedule or hasn&#39;t been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=f8sCFmE8g1rzD0F4ampQhU120Q4
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me/schedule/calendar/8eb43a75-297c-406f-a6c3-810c654a4c68</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/schedule/calendar/8eb43a75-297c-406f-a6c3-810c654a4c68&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=f8sCFmE8g1rzD0F4ampQhU120Q4&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 11eeaadf-7123-4e88-8e80-9c9954aad76c
X-Runtime: 0.024432
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

