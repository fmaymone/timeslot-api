# Me API

## Hide Calendar from mySchedule

### DELETE /v1/me/schedule/calendar/:calendar_uuid

returns 200 if calendar successfully removed from schedule or hasn&#39;t been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=oL9EaAiRk-NBGV6P-ePTaYipQVI
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me/schedule/calendar/a320b6cc-c544-43f9-bbee-b4b247661191</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/schedule/calendar/a320b6cc-c544-43f9-bbee-b4b247661191&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=oL9EaAiRk-NBGV6P-ePTaYipQVI&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: b1e79f97-f322-4164-bed1-21164f7f2ffd
X-Runtime: 0.044723
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

