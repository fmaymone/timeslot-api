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
Authorization: Token token=XsfKYJtAAIFj9kKme7cKh6Q1OMU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/outlook&quot; -d &#39;{&quot;group&quot;:&quot;261b9874-cab8-4b6d-a1b9-eb40c6da5c5d&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=XsfKYJtAAIFj9kKme7cKh6Q1OMU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;261b9874-cab8-4b6d-a1b9-eb40c6da5c5d.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;fa15dedd4f0566afa4735871bd144d37&quot;
X-Request-Id: d0283554-76be-4d15-9328-a0da70d19f6c
X-Runtime: 0.012361
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
