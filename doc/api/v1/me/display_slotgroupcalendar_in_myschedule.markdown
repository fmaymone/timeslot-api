# Me API

## Display Slotgroup/Calendar in mySchedule

### POST /v1/me/schedule/slotgroup/:slotgroup_uuid

returns 200 if slotgroup was successfully added to schedule or has been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=vsWXILR_v-xj2uePQOAH_PBj6B0
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/me/schedule/slotgroup/e0441973-80d2-40ea-875c-543592241f1a</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/schedule/slotgroup/e0441973-80d2-40ea-875c-543592241f1a&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=vsWXILR_v-xj2uePQOAH_PBj6B0&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: ae1d8e47-d28d-4a48-8ae7-3a1989b82d78
X-Runtime: 0.027001
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

