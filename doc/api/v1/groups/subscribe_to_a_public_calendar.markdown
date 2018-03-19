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
Authorization: Token token=CAUtjxOC7mmygfPqiIOn8jznOQE
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/calendars/32533b4b-bf00-46cf-ab94-7887f0715094/subscribe</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/calendars/32533b4b-bf00-46cf-ab94-7887f0715094/subscribe&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=CAUtjxOC7mmygfPqiIOn8jznOQE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;35a955c22946178a7849e228986ec304&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: df6886d8-9eb5-4a95-8738-c7ec87a69aee
X-Runtime: 0.091103
Content-Length: 156</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript

```
