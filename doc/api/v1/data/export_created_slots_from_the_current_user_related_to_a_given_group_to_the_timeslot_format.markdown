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
Authorization: Token token=D_v-2-galnncYZ7bkOiOzS7n4QM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/timeslot&quot; -d &#39;{&quot;group&quot;:&quot;e012de05-d6c6-4f15-b1bd-35fad61c7274&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=D_v-2-galnncYZ7bkOiOzS7n4QM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;e012de05-d6c6-4f15-b1bd-35fad61c7274.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;a2b4b2860ce6673140f167fa633a0872&quot;
X-Request-Id: b9ad6ce8-b3b2-44d5-9619-2b12223a0b76
X-Runtime: 0.024463
Content-Length: 1233</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
