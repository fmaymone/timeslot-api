# Groups API

## Get all dates when slots in my library happen

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
Authorization: Token token=wigH1rTYFkmBAv4BIfUw58Cabsg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/30561286-0d17-417a-9b44-94b69c5dd81f/dates</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/30561286-0d17-417a-9b44-94b69c5dd81f/dates&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=wigH1rTYFkmBAv4BIfUw58Cabsg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;172f39b753b94af136452004f496959d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e6f65a0c-74cf-4aee-948e-05a5f86e308a
X-Runtime: 0.020304
Content-Length: 168</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
