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
Authorization: Token token=k0XqhImxwiJjQPn0dzkBzmC8kt8
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/google&quot; -d &#39;{&quot;group&quot;:&quot;5a0cff88-911c-4fa3-96b7-f11223ffd8a4&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=k0XqhImxwiJjQPn0dzkBzmC8kt8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;5a0cff88-911c-4fa3-96b7-f11223ffd8a4.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;53f56e84f34219317f9670c8690990bd&quot;
X-Request-Id: cadf776e-9285-4ac9-ab99-d7d0e105a00d
X-Runtime: 0.013547
Content-Length: 297</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
