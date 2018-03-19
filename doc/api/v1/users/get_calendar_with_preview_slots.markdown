# Users API

## Get calendar with preview slots

### GET /v1/users/:id/calendars

### Parameters

Name : id
Description : ID of the user to get the calendars for.

### Request

#### Headers

<pre>Authorization: Token token=lQjLWVVKbOWHROnLa9Hxwql7NCY
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/207/calendars</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/207/calendars&quot; -X GET \
	-H &quot;Authorization: Token token=lQjLWVVKbOWHROnLa9Hxwql7NCY&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;b7cb9640713b76b1606715f90ee9ba6b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 02a294cc-b82d-4931-b94e-f82313eeaad0
X-Runtime: 0.047942
Content-Length: 1983</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
