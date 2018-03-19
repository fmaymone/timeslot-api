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
Authorization: Token token=LHgwlq5HK5D1Jb1x9qLUc7u9u5k
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/calendars</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/calendars&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=LHgwlq5HK5D1Jb1x9qLUc7u9u5k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;415d0e7b951110a0633585cdb2a1fe5f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5ec7b0cb-dcd9-4de0-8bfc-97b9178c0adf
X-Runtime: 0.031048
Content-Length: 1656</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
