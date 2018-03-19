# Me API

## Hide Calendar from mySchedule

### DELETE /v1/me/schedule/calendar/:calendar_uuid

returns 200 if calendar successfully removed from schedule or hasn&#39;t been part of it anyway.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=hl7MI6s2S1a8aWahU91zZ7Pwn0A
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me/schedule/calendar/977b161b-5622-4327-8196-d4cfb3253faa</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/me/schedule/calendar/977b161b-5622-4327-8196-d4cfb3253faa&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=hl7MI6s2S1a8aWahU91zZ7Pwn0A&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: b7a49949-f597-4fd9-a6e3-d7a748a3a2a9
X-Runtime: 0.061136
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

