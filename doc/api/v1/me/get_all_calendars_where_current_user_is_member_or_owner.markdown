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
Authorization: Token token=2MNbAtnrIrl8mdSgIWYhEtMDGpU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/calendars</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/calendars&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=2MNbAtnrIrl8mdSgIWYhEtMDGpU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;be0bfb6d8a03d533359cbc657f1b4e5a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: adc5799d-8bad-41d2-80d4-0fdac294cd38
X-Runtime: 0.033560
Content-Length: 1656</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
