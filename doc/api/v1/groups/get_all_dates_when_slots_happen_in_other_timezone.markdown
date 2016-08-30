# Groups API

## Get all dates when slots happen in other timezone

### GET /v1/groups/:group_uuid/dates

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
Authorization: Token token=uJAq8oUMd8FCvzg5s0QAvdX_dEk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/21c1d743-0104-48a6-8636-5e88560c15c4/dates?timezone=-05%3A00</pre>

#### Query Parameters

<pre>timezone: -05:00</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/21c1d743-0104-48a6-8636-5e88560c15c4/dates?timezone=-05%3A00&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=uJAq8oUMd8FCvzg5s0QAvdX_dEk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1f3a63c4833b31e4c94867f927127d79&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0680dae3-ec05-449e-9589-0ae1fc67dc14
X-Runtime: 0.007200
Content-Length: 116</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    "2016-01-31",
    "2016-02-01",
    "2016-01-02",
    "2016-01-01",
    "2016-01-03",
    "2015-12-31",
    "2016-05-18",
    "2016-01-04"
  ]
}
```
