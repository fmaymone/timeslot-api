# Data API

## Export Slots to the Google Format

### POST /v1/export/google

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.

If the parameter group is missing, all Slot will be exported.

If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=EKU1hmE8DT9KwZ6DlzWBSz1NQdw
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/google&quot; -d &#39;{&quot;group&quot;:&quot;55410acc-a8a7-4fd5-bdcb-5bb75a693027&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=EKU1hmE8DT9KwZ6DlzWBSz1NQdw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;55410acc-a8a7-4fd5-bdcb-5bb75a693027.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;efcef2533c1297d2d77b3ce0018964c0&quot;
X-Request-Id: c068cd70-b1ac-46a8-99d0-2e3c46ae0ae6
X-Runtime: 0.011915
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
