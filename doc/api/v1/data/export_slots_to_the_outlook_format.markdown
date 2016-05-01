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
Authorization: Token token=e-lznxwmLt7SA28TDg56KbN7ccY
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### Body
```javascript
{
  "group" : "d3539be1-d930-4fbc-850d-b12c7aac23da"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/outlook&quot; -d &#39;{&quot;group&quot;:&quot;d3539be1-d930-4fbc-850d-b12c7aac23da&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=e-lznxwmLt7SA28TDg56KbN7ccY&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;d3539be1-d930-4fbc-850d-b12c7aac23da.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;fa15dedd4f0566afa4735871bd144d37&quot;
X-Request-Id: 1aca13dc-ca59-4fb7-abe8-f00b2096e91e
X-Runtime: 0.005144
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[binary data]
```
