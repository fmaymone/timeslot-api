# Data API

## Export all created Slots of the current user to a file (Google)

### POST /v1/export/google

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
Accept: text/plain
Authorization: Token token=DeZ09OcvySBIemrco43__jx8w2U
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/google&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=DeZ09OcvySBIemrco43__jx8w2U&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;Timeslot-Export.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
ETag: W/&quot;204a1d0e18a295e64abf12276b573c76&quot;
X-Request-Id: 7fa49ee3-8425-4b0d-a539-05bd385bcb7a
X-Runtime: 0.018356
Vary: Origin
Content-Length: 1069</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
