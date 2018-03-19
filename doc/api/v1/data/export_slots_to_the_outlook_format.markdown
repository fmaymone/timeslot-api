# Data API

## Export Slots to the Outlook Format

### POST /v1/export/outlook

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.

If the parameter group is missing, all Slot will be exported.

If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=ps-SqbWWMqk4q7b4W_IDb2pTZ7s
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/outlook&quot; -d &#39;{&quot;group&quot;:&quot;73704a52-003e-4f8d-ac45-64827d4c63b6&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=ps-SqbWWMqk4q7b4W_IDb2pTZ7s&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;73704a52-003e-4f8d-ac45-64827d4c63b6.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;fa15dedd4f0566afa4735871bd144d37&quot;
X-Request-Id: 46e4a375-be9a-4d2c-8c78-9fb8283998a9
X-Runtime: 0.013991
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
