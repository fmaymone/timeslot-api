# Data API

## Export all created Slots of the current user to a file (Timeslot)

### POST /v1/export/timeslot

returns 404 if the group uuid was not found

returns 422 if parameters are invalid or missing

returns 500 if an error occurs during the export

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.

If the parameter group is missing, all Slot will be exported.

If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=lhc86bzXpXM6xkjGoo0P6e-eACQ
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/timeslot&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=lhc86bzXpXM6xkjGoo0P6e-eACQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;Timeslot-Export.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;317737fdb63259ee824a4ffd533f3087&quot;
X-Request-Id: 76d73f49-8ac9-4e1b-a1b9-1eab42f41da4
X-Runtime: 1.059714
Content-Length: 6069</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
