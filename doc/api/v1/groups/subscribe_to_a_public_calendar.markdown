# Groups API

## Subscribe to a public calendar

### POST /v1/calendars/:slotgroup_uuid/subscribe

Adds the current user to the slotgroup/calendar. Calendar must be public.

returns 201 if invite successfully created

returns 404 if group UUID is invalid

### Parameters

Name : slotgroup_uuid *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=SPE0m27OVehsf76TxGh3DSwN41s
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/calendars/a421b343-3e7c-411b-91a8-17436c5fe487/subscribe</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/calendars/a421b343-3e7c-411b-91a8-17436c5fe487/subscribe&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=SPE0m27OVehsf76TxGh3DSwN41s&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;3a1b99546e565e5b5838b66786334815&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bfa174d1-f8b9-4031-a382-bb0eeddf27e8
X-Runtime: 0.126904
Content-Length: 156</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript

```
