# Me API

## Display Calendar in mySchedule

### POST /v1/me/schedule/calendar/:calendar_uuid

returns 200 if calendar was successfully added to schedule or has been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=cvxnc_bDYyXFjIi3UEtRqB6IkVc
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/me/schedule/calendar/eb15fba5-230c-4510-b2aa-f91695b0dedb</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/schedule/calendar/eb15fba5-230c-4510-b2aa-f91695b0dedb&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=cvxnc_bDYyXFjIi3UEtRqB6IkVc&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 46c25620-ce54-4dea-aa08-06856a664bfc
X-Runtime: 0.022138
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

