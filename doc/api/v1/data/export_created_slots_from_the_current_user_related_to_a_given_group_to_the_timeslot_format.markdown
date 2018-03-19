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
Authorization: Token token=4LflZZYcr65euEkaBDubZmxmJKg
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/timeslot&quot; -d &#39;{&quot;group&quot;:&quot;110dd818-d82a-4af2-91e0-8812fb4d7939&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=4LflZZYcr65euEkaBDubZmxmJKg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;110dd818-d82a-4af2-91e0-8812fb4d7939.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;35dddde6dbf9d527bc2ad4ec03471bc1&quot;
X-Request-Id: 54c33b73-bfad-4ed7-9981-82a1662bb1a7
X-Runtime: 0.027632
Content-Length: 1233</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
