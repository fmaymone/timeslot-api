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
Authorization: Token token=8UF-calCMeauY6TjOw5W-NRep84
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/cfaf2f9d-ca73-40ac-b1f0-b68bf4eb40ae/dates</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/cfaf2f9d-ca73-40ac-b1f0-b68bf4eb40ae/dates&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=8UF-calCMeauY6TjOw5W-NRep84&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;172f39b753b94af136452004f496959d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5c5b5421-d2f0-4ac6-a4a5-4c726185b8c6
X-Runtime: 0.014633
Content-Length: 168</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
