# Users API

## Get list of calendars of another user

### GET /v1/users/:id/calendars

Includes all public calendars of this user and non-public calendars where user and current user are members.

returns array of calendars

returns 404 if current user not friend with other user

### Parameters

Name : id
Description : ID of the user to get the calendars for.

### Request

#### Headers

<pre>Authorization: Token token=INQX2z_mg1EeL79PArtIfpTmdTA
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/186/calendars</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/186/calendars&quot; -X GET \
	-H &quot;Authorization: Token token=INQX2z_mg1EeL79PArtIfpTmdTA&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;41e28dbc0c2624ca9165075d8290f798&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f0d6e924-5f65-4e49-8706-cefb8dd57b85
X-Runtime: 0.011479
Vary: Origin
Content-Length: 1342</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
