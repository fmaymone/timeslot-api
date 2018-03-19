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

<pre>Authorization: Token token=LSStVRT1xPImQ3cHDZUdYWryroo
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/181/dates</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/181/dates&quot; -X GET \
	-H &quot;Authorization: Token token=LSStVRT1xPImQ3cHDZUdYWryroo&quot; \
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
X-Request-Id: 4c895649-1faf-414b-913f-36a33534cd4d
X-Runtime: 0.031608
Content-Length: 64</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
