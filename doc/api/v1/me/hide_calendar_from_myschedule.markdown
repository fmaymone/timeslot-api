# Me API

## Hide Calendar from mySchedule

### DELETE /v1/me/schedule/calendar/:calendar_uuid

returns 200 if calendar successfully removed from schedule or hasn&#39;t been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=PFu1kzNmzYEWaCNxlgd1gle2G8U
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me/schedule/calendar/07508661-2de8-4679-a151-71151de159c5</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/schedule/calendar/07508661-2de8-4679-a151-71151de159c5&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=PFu1kzNmzYEWaCNxlgd1gle2G8U&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 8064141d-9109-40c3-8de0-11f9bba22027
X-Runtime: 0.022977
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

