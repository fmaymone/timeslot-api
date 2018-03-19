# Users API

## Get calendar with preview slots

### GET /v1/users/:id/calendars

### Parameters

Name : id
Description : ID of the user to get the calendars for.

### Request

#### Headers

<pre>Authorization: Token token=d7sf8gcn-jHWOLReHd1fn-8tpmI
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/205/calendars</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/205/calendars&quot; -X GET \
	-H &quot;Authorization: Token token=d7sf8gcn-jHWOLReHd1fn-8tpmI&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;e0f8c862a3392afaf813c8462feed1d8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a7c34997-6227-4200-b3c1-1d442b4b26bb
X-Runtime: 0.042991
Content-Length: 1983</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
