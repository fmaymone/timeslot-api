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
Authorization: Token token=DROphDiUd_c_gkXmyoeaCqBf-KU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/timeslot&quot; -d &#39;{&quot;group&quot;:&quot;d1372861-a0ed-42e8-9935-bdd740104fa1&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=DROphDiUd_c_gkXmyoeaCqBf-KU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;d1372861-a0ed-42e8-9935-bdd740104fa1.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;d751713988987e9331980363e24189ce&quot;
X-Request-Id: d047bb81-72f3-4cec-8f79-b5c4c48868f8
X-Runtime: 0.013181
Content-Length: 2</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
