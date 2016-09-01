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
Authorization: Token token=BpbXVbkBzqzJ47uIxtmFuZYZUFE
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### Body
```javascript
{
  "group" : "cd0a2111-35cd-4ae9-9cba-572115fe5d62"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/outlook&quot; -d &#39;{&quot;group&quot;:&quot;cd0a2111-35cd-4ae9-9cba-572115fe5d62&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=BpbXVbkBzqzJ47uIxtmFuZYZUFE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;cd0a2111-35cd-4ae9-9cba-572115fe5d62.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;fa15dedd4f0566afa4735871bd144d37&quot;
X-Request-Id: ccb13437-3966-44a2-9b61-73e46b894533
X-Runtime: 0.009638
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[binary data]
```
