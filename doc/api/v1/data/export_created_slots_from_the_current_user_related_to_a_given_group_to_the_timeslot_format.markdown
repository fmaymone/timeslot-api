# Data API

## Export created Slots from the current user related to a given Group to the Timeslot format

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
Authorization: Token token=3KF-b8oG2wtoOE4v5NYUZruZE-o
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/export/timeslot&quot; -d &#39;{&quot;group&quot;:&quot;d0cd1887-ba64-4035-8169-3ba7dd20c2a8&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=3KF-b8oG2wtoOE4v5NYUZruZE-o&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;d0cd1887-ba64-4035-8169-3ba7dd20c2a8.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;8474355727df460eb2e2b02ff13e0995&quot;
X-Request-Id: c3c92398-cc44-4ed9-8296-c1662e595af7
X-Runtime: 0.030375
Content-Length: 1233</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
