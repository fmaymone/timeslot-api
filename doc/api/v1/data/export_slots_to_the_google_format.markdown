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
Authorization: Token token=XrAfiZB8wlznAB01Vrx1I-v75Eg
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/export/google&quot; -d &#39;{&quot;group&quot;:&quot;363e604c-38a2-45e8-b61f-c777ee4dfba2&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=XrAfiZB8wlznAB01Vrx1I-v75Eg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;363e604c-38a2-45e8-b61f-c777ee4dfba2.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;efcef2533c1297d2d77b3ce0018964c0&quot;
X-Request-Id: 8c782b03-7233-47e0-9a1b-24a411304879
X-Runtime: 0.014518
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
