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
Authorization: Token token=l886Nv-F8azm00zHlhz10Qw_Lwk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/369f7045-ab80-4432-8e68-fa8049915303/dates</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/369f7045-ab80-4432-8e68-fa8049915303/dates&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=l886Nv-F8azm00zHlhz10Qw_Lwk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;896400875799270da2d5199706a15b00&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c7690605-00d9-476c-8dc7-537f801a8c24
X-Runtime: 0.007258
Content-Length: 168</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    "2016-02-02",
    "2011-03-30",
    "2016-05-18",
    "2011-03-31",
    "2016-02-01",
    "2010-03-30",
    "2016-05-19",
    "2010-03-31",
    "2016-03-30",
    "2016-03-02",
    "2016-03-03",
    "2016-03-01"
  ]
}
```
