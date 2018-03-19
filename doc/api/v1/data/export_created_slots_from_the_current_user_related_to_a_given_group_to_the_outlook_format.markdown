# Data API

## Export created Slots from the current user related to a given Group to the Outlook format

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
Authorization: Token token=n7w8HTC9om9wvakDJkor6f8rcYY
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/outlook&quot; -d &#39;{&quot;group&quot;:&quot;1715c7ea-707e-40a4-a136-648c10d03209&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=n7w8HTC9om9wvakDJkor6f8rcYY&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;1715c7ea-707e-40a4-a136-648c10d03209.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;106f77abe1de95bb365304c564fa4860&quot;
X-Request-Id: d4dcfcac-02f7-4db1-8d76-3a4df4e0e057
X-Runtime: 0.011404
Content-Length: 176</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
