# Data API

## Export created Slots from the current user related to a given Group to the iCalendar format

### POST /v1/export/ical

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.

If the parameter group is missing, all Slot will be exported.

If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=udcEcdFOIEuyZr2fktRfQo_aofs
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/export/ical&quot; -d &#39;{&quot;group&quot;:&quot;4e4f00d9-97a3-4f4b-8eed-1feac2db20ca&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=udcEcdFOIEuyZr2fktRfQo_aofs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;4e4f00d9-97a3-4f4b-8eed-1feac2db20ca.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;ee98a3b337c789695d82f86167b6a054&quot;
X-Request-Id: 457d040a-220b-403c-8e51-d1544fdc427b
X-Runtime: 0.020934
Content-Length: 297</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
