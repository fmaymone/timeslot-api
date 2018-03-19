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
Authorization: Token token=84WbwgFTcN1MjjdGXg_6jy91s6I
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/google&quot; -d &#39;{&quot;group&quot;:&quot;58353112-4293-49b5-ba3b-d65f36145f29&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=84WbwgFTcN1MjjdGXg_6jy91s6I&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;58353112-4293-49b5-ba3b-d65f36145f29.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;efcef2533c1297d2d77b3ce0018964c0&quot;
X-Request-Id: 0edb52a5-1153-4f21-8422-9ca5d47e2559
X-Runtime: 0.016271
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
