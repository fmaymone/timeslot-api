# Me API

## Display Calendar in mySchedule

### POST /v1/me/schedule/calendar/:calendar_uuid

returns 200 if calendar was successfully added to schedule or has been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=9Vm4D7IGhJa0BJOQW8EwJT54-fI
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/me/schedule/calendar/0f4bed6a-df8c-4973-b122-8d16836ad996</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/me/schedule/calendar/0f4bed6a-df8c-4973-b122-8d16836ad996&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=9Vm4D7IGhJa0BJOQW8EwJT54-fI&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: b6dc6706-9a4c-444f-8b70-31ab1d4a6fea
X-Runtime: 0.073045
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

