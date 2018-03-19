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
Authorization: Token token=NTHVcMZD4pMwmqQeHSKxGmJgKMU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/b186227b-a97c-4cdb-8519-56788fed0d65/dates</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/b186227b-a97c-4cdb-8519-56788fed0d65/dates&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=NTHVcMZD4pMwmqQeHSKxGmJgKMU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;172f39b753b94af136452004f496959d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6bda3203-7261-4413-ad28-378892e991c8
X-Runtime: 0.017266
Content-Length: 168</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
