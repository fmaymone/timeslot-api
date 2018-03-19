# Users API

## Get list of calendars of another user

### GET /v1/users/:id/calendars

Includes all public calendars of this user and non-public calendars where user and current user are members.

returns array of calendars with up to 4 preview slots per calendar

returns 404 if current user not friend with other user

### Parameters

Name : id
Description : ID of the user to get the calendars for.

### Request

#### Headers

<pre>Authorization: Token token=OO98qxI2Yk85t25yAyRh5dZ8j9k
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/193/calendars</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/193/calendars&quot; -X GET \
	-H &quot;Authorization: Token token=OO98qxI2Yk85t25yAyRh5dZ8j9k&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;3ce6d24d868caa3ae41b77c4b4ea424b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 95f9778f-60bb-4c3b-b370-5eb121838e13
X-Runtime: 0.103014
Content-Length: 3628</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
