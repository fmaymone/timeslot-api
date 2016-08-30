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
Authorization: Token token=wJHzO7UEsBjS3eIpnpHqX23_Dv0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/48765e4d-3b17-4e24-a270-4023845a32d0/dates</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/48765e4d-3b17-4e24-a270-4023845a32d0/dates&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=wJHzO7UEsBjS3eIpnpHqX23_Dv0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;5073d64e42996d30093cc4e457c42b04&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: babc6bfd-8469-4af6-a214-633048b64521
X-Runtime: 0.010910
Content-Length: 129</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    "2016-02-02",
    "2016-05-19",
    "2016-02-01",
    "2016-01-05",
    "2016-01-02",
    "2016-01-01",
    "2016-01-03",
    "2016-05-18",
    "2016-01-04"
  ]
}
```
