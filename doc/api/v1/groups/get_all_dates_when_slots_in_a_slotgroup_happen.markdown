# Groups API

## Get all dates when slots in a slotgroup happen

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
Authorization: Token token=_mKe42nzt2_0bNHZfgH56zScTRw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/35018372-e376-4ce1-96b1-a5426b7f2f77/dates</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/35018372-e376-4ce1-96b1-a5426b7f2f77/dates&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=_mKe42nzt2_0bNHZfgH56zScTRw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;5073d64e42996d30093cc4e457c42b04&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1ce1b840-355d-4abb-ace8-549423b0fc65
X-Runtime: 0.021038
Content-Length: 129</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
