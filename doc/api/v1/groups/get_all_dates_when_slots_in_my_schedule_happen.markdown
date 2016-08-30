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
Authorization: Token token=jjpZMVAZwN_bARlB6f5mAy7nSu4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/8e0c9ca0-8114-4a19-94f8-6a64a17254fc/dates</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/8e0c9ca0-8114-4a19-94f8-6a64a17254fc/dates&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=jjpZMVAZwN_bARlB6f5mAy7nSu4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;ceef9fbf8c05f5f2a0e731bb348b40d6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 094a3c91-f44b-4271-9907-06c33e7f8e4e
X-Runtime: 0.005873
Content-Length: 155</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    "2016-02-02",
    "2016-01-05",
    "2011-03-30",
    "2016-01-01",
    "2016-05-18",
    "2016-01-02",
    "2016-01-04",
    "2011-03-31",
    "2016-02-01",
    "2016-01-03",
    "2016-05-19"
  ]
}
```
