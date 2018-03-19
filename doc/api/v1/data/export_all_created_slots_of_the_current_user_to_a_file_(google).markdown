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
Authorization: Token token=wAZ0nAX0VdSgteDTSNE4Q2tV7Zk
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/google&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=wAZ0nAX0VdSgteDTSNE4Q2tV7Zk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;Timeslot-Export.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;72cad4cb82c7aaf4576341eed0475a21&quot;
X-Request-Id: 4fbb99c8-a99e-423c-a92f-ceb895f60d02
X-Runtime: 0.024098
Content-Length: 1069</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
