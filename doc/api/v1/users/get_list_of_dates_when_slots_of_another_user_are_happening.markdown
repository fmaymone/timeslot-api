# Users API

## Get list of dates when slots of another user are happening

### GET /v1/users/:id/dates

Returns all dates where a slot returned by GET /users/:id/slots is happening.

returns 404 if user doesn&#39;t exist

### Parameters

Name : id
Description : ID of the user to get the slot dates for.

### Request

#### Headers

<pre>Authorization: Token token=pGY3mhrSK3aAaZOVhITuDoUTlkk
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/183/dates</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/183/dates&quot; -X GET \
	-H &quot;Authorization: Token token=pGY3mhrSK3aAaZOVhITuDoUTlkk&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;37238668c82ab142750f45cd91f05adb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 16200f0c-0c42-407a-9230-28f85f1af135
X-Runtime: 0.050456
Content-Length: 64</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
