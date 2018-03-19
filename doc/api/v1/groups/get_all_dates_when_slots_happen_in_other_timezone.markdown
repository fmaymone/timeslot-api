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
Authorization: Token token=0tsIypm39P-QEv6NEk_fjgUjCFI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/b6e4c644-145d-44c9-ac26-0aec7ac46e00/dates?timezone=-05%3A00</pre>

#### Query Parameters

<pre>timezone: -05:00</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/b6e4c644-145d-44c9-ac26-0aec7ac46e00/dates?timezone=-05%3A00&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=0tsIypm39P-QEv6NEk_fjgUjCFI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1f3a63c4833b31e4c94867f927127d79&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 35d1ad4d-7c7c-48fe-80b5-022910742f89
X-Runtime: 0.010694
Content-Length: 116</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
