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
Authorization: Token token=SZr01NIL7LyGU-P5DGEv21v7KoQ
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/outlook&quot; -d &#39;{&quot;group&quot;:&quot;d7158d59-b06a-4c2d-a7b9-ab0a775522d3&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=SZr01NIL7LyGU-P5DGEv21v7KoQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;d7158d59-b06a-4c2d-a7b9-ab0a775522d3.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;106f77abe1de95bb365304c564fa4860&quot;
X-Request-Id: 3f5db5ea-54c6-44b5-b6e9-91a5692c3905
X-Runtime: 0.017368
Content-Length: 176</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
