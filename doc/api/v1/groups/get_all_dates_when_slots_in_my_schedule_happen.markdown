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
Authorization: Token token=yuA6XUwzwlqg3acMJ_DGVZPeLvM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/984ab51d-72ff-4951-be43-af4ef3682c09/dates</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/984ab51d-72ff-4951-be43-af4ef3682c09/dates&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=yuA6XUwzwlqg3acMJ_DGVZPeLvM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;f4bc42dffe1352882e4c8202af6c43b3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e09f439a-96ae-43af-9d9a-6cdedadb3f10
X-Runtime: 0.010686
Content-Length: 155</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
