# Me API

## Display Slotgroup/Calendar in mySchedule

### POST /v1/me/schedule/slotgroup/:slotgroup_uuid

returns 200 if slotgroup was successfully added to schedule or has been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=P_Vgzxl3esKEtcE8b2jNbex43Zw
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/me/schedule/slotgroup/a490064d-c956-4358-8b18-acf2ac947941</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/schedule/slotgroup/a490064d-c956-4358-8b18-acf2ac947941&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=P_Vgzxl3esKEtcE8b2jNbex43Zw&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: da4f3f4a-a6dd-4288-80df-6e97355ed5ca
X-Runtime: 0.025698
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

