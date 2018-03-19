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
Authorization: Token token=vvAvhWl0-LpJ30NqUNDTQrFlsYA
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/google&quot; -d &#39;{&quot;group&quot;:&quot;b9d5bcac-210d-400b-8ce1-c24d21ac8158&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=vvAvhWl0-LpJ30NqUNDTQrFlsYA&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;b9d5bcac-210d-400b-8ce1-c24d21ac8158.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;7b95bb1568f3c92155dc0601fa8eccb5&quot;
X-Request-Id: 6b114ff2-5e6b-4896-a6c3-002cf928d42b
X-Runtime: 0.014679
Content-Length: 297</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
