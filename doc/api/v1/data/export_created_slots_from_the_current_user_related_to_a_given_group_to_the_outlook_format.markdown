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
Authorization: Token token=2PUqIZSZendN151pko7KKfcJKds
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/export/outlook&quot; -d &#39;{&quot;group&quot;:&quot;f3225810-fe9a-4ea9-bbb9-15770795a1e4&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=2PUqIZSZendN151pko7KKfcJKds&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;f3225810-fe9a-4ea9-bbb9-15770795a1e4.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;106f77abe1de95bb365304c564fa4860&quot;
X-Request-Id: 4fec4161-27a1-4cb9-b8df-96c4e53a90e6
X-Runtime: 0.016378
Content-Length: 176</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
