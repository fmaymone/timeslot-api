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
Authorization: Token token=guxD2Wh5RWsU5oaMEdhfeDzeD1k
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/timeslot&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=guxD2Wh5RWsU5oaMEdhfeDzeD1k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;Timeslot-Export.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
ETag: W/&quot;522714c122c73de784ea84a593d6d936&quot;
X-Request-Id: 8ec70807-5af2-4a0b-8689-b72e0c16b806
X-Runtime: 0.013711
Vary: Origin
Content-Length: 886</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
