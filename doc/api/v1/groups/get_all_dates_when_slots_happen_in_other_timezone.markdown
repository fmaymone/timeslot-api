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
Authorization: Token token=mnv0FYhLcRvhnLzFhFYPrsD2gVc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/97bd9865-ceda-4fff-8dca-38b14004f4fd/dates?timezone=-05%3A00</pre>

#### Query Parameters

<pre>timezone: -05:00</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/97bd9865-ceda-4fff-8dca-38b14004f4fd/dates?timezone=-05%3A00&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=mnv0FYhLcRvhnLzFhFYPrsD2gVc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1f3a63c4833b31e4c94867f927127d79&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4e524e40-e803-4134-8c88-4a5beadc4ac7
X-Runtime: 0.011355
Content-Length: 116</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
