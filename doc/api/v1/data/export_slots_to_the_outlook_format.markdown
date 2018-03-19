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
Authorization: Token token=wIgnBLafdZ7I8jYZLEU90pM1nr8
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/export/outlook&quot; -d &#39;{&quot;group&quot;:&quot;4bb8fcd8-c6a4-475c-a08f-8c2513feb175&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=wIgnBLafdZ7I8jYZLEU90pM1nr8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;4bb8fcd8-c6a4-475c-a08f-8c2513feb175.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;fa15dedd4f0566afa4735871bd144d37&quot;
X-Request-Id: 39116dd2-346a-48d1-b7f7-83d55e2b01b3
X-Runtime: 0.013865
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
