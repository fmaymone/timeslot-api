# Me API

## Display Calendar in mySchedule

### POST /v1/me/schedule/calendar/:calendar_uuid

returns 200 if calendar was successfully added to schedule or has been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=LureHm8EA-MxdtpmcSguRXLoGPs
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/me/schedule/calendar/9bcb3dce-818a-4979-9f16-1d428aff16bc</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/schedule/calendar/9bcb3dce-818a-4979-9f16-1d428aff16bc&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=LureHm8EA-MxdtpmcSguRXLoGPs&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 78064d65-62e5-458a-98e7-5feca078c50d
X-Runtime: 0.021516
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

