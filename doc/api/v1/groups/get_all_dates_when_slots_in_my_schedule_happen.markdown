# Groups API

## Get all dates when slots in my_schedule happen

### GET /v1/groups/:group_uuid/dates

This is needed for the agenda picker to show the correct color for dates with slots.

returns 200 and an array of dates

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to get slots for

Name : timezone
Description : Offset for the timezone as string (&#39;+10:00&#39;), default is UTC


### Response Fields

Name : data
Description : Array with dates where a slot is happening, (starting, ongoing or ending)

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=ADEoPyQIgdOs9FEeznU_mORIuhQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/b84e9a18-d025-4859-ba73-6020a532cf26/dates</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/b84e9a18-d025-4859-ba73-6020a532cf26/dates&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ADEoPyQIgdOs9FEeznU_mORIuhQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;f4bc42dffe1352882e4c8202af6c43b3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9a81b64f-7155-467f-93e9-bddc9351bf65
X-Runtime: 0.010195
Content-Length: 155</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
