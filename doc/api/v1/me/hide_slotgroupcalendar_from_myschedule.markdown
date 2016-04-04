# Me API

## Hide Slotgroup/Calendar from mySchedule

### DELETE /v1/me/schedule/slotgroup/:slotgroup_uuid

returns 200 if slotgroup successfully removed from schedule or hasn&#39;t been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=oOECZ5rwZ0CTAk9ceB-2MHTcRU0
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me/schedule/slotgroup/0838b3dc-f951-46c2-8286-de1fa6356b55</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/schedule/slotgroup/0838b3dc-f951-46c2-8286-de1fa6356b55&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=oOECZ5rwZ0CTAk9ceB-2MHTcRU0&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 2d04aa02-56ae-4757-a49b-3e88bc6505c5
X-Runtime: 0.021592
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

