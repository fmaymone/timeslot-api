# Data API

## Export created Slots from the current user related to a given Group to the Google format

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
Authorization: Token token=ygKhxICj7pqVcOQW4p3IJTeJxSs
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/export/google&quot; -d &#39;{&quot;group&quot;:&quot;acfcd188-3f6e-4fe4-8b02-390ddd20d97e&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=ygKhxICj7pqVcOQW4p3IJTeJxSs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;acfcd188-3f6e-4fe4-8b02-390ddd20d97e.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;ad4f7ed2011825af3c696101a89ae140&quot;
X-Request-Id: d80979fd-a622-40b1-be46-11a8ae87514c
X-Runtime: 0.019193
Content-Length: 297</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
