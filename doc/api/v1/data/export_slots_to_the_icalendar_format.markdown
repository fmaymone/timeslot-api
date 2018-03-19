# Data API

## Export Slots to the iCalendar Format

### POST /v1/export/ical

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.

If the parameter group is missing, all Slot will be exported.

If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=cnhdzwYFtq2n0fUhb7DEYDGqPBE
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/ical&quot; -d &#39;{&quot;group&quot;:&quot;3ba6fd7d-61ae-4302-a4c6-302b4554d90a&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=cnhdzwYFtq2n0fUhb7DEYDGqPBE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;3ba6fd7d-61ae-4302-a4c6-302b4554d90a.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;efcef2533c1297d2d77b3ce0018964c0&quot;
X-Request-Id: 0173e99c-8e30-4e4b-b5dc-a4e4f020b9d4
X-Runtime: 0.013340
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
