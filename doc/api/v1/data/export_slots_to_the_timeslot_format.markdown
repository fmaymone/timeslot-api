# Data API

## Export Slots to the Timeslot Format

### POST /v1/export/timeslot

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.

If the parameter group is missing, all Slot will be exported.

If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=ct1xXbZYoPTJm0ioTvpAdgCNmv4
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### Body
```javascript
{
  "group" : "82fcd1dc-158d-410e-8919-394d8e8c6563"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/timeslot&quot; -d &#39;{&quot;group&quot;:&quot;82fcd1dc-158d-410e-8919-394d8e8c6563&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ct1xXbZYoPTJm0ioTvpAdgCNmv4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;82fcd1dc-158d-410e-8919-394d8e8c6563.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;d751713988987e9331980363e24189ce&quot;
X-Request-Id: 8c48b234-92d9-41d4-961d-e3688f73d965
X-Runtime: 0.007409
Content-Length: 2</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[]
```
