# Me API

## Get all calendars where current user is member or owner

### GET /v1/me/calendars

returns an array of calendars

### Response Fields

Name : id
Description : UUID of the calendar

Name : name
Description : name of the calendar

Name : image
Description : URL of the calendar image

Name : public
Description : visibility of the calendar

Name : owner
Description : user details of the calendar owner

Name : showInSchedule
Description : are calendar slots shown in schedule

Name : createdAt
Description : Creation datetime of the calendar

Name : updatedAt
Description : Last update of the calendaar

Name : deletedAt
Description : Deletion datetime of the calendar

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=tu5z-pzPD3cDqwilfttt3lLl7w0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/calendars</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/me/calendars&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=tu5z-pzPD3cDqwilfttt3lLl7w0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;f1622679ad50d0cd23e220d2e81c8623&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e5812b67-d19a-42a1-80e6-71738c183bc3
X-Runtime: 0.049112
Content-Length: 1656</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
