# Data API

## Export Slots to the iCalendar Format

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
Authorization: Token token=oN1CP2g3l8ApiDGF9Qnq-6UlT_4
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/ical&quot; -d &#39;{&quot;group&quot;:&quot;cd11c900-a844-44f8-a7bd-d486b003f8ec&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=oN1CP2g3l8ApiDGF9Qnq-6UlT_4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;cd11c900-a844-44f8-a7bd-d486b003f8ec.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;efcef2533c1297d2d77b3ce0018964c0&quot;
X-Request-Id: cbf8269c-be46-45fb-9da1-1716f9fb6a1c
X-Runtime: 0.012634
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
