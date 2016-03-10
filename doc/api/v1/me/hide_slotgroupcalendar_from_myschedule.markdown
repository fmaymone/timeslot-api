# Me API

## Hide Slotgroup/Calendar from mySchedule

### DELETE /v1/me/schedule/slotgroup/:slotgroup_uuid

returns 200 if slotgroup successfully removed from schedule or hasn&#39;t been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=O1aDanoX8ihc27AYQvq8OXZ5r5g
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me/schedule/slotgroup/7cb1b245-d787-4f77-a10d-82034fce9f85</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/schedule/slotgroup/7cb1b245-d787-4f77-a10d-82034fce9f85&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=O1aDanoX8ihc27AYQvq8OXZ5r5g&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: ad842d72-1ee3-4273-aff9-31b378742d75
X-Runtime: 0.026523
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

