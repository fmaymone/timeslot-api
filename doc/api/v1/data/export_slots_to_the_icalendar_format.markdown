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
Authorization: Token token=zzh94Z49dKQQ-PBVvBllnU6RHz4
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/export/ical&quot; -d &#39;{&quot;group&quot;:&quot;a8fa0b26-a067-47f0-9d21-2b8463cdebf3&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=zzh94Z49dKQQ-PBVvBllnU6RHz4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;a8fa0b26-a067-47f0-9d21-2b8463cdebf3.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;efcef2533c1297d2d77b3ce0018964c0&quot;
X-Request-Id: d43d00de-95ce-46b7-8ddf-e4a01d7db811
X-Runtime: 0.012028
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
