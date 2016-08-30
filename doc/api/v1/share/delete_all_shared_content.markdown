# Share API

## Delete all shared content

### DELETE /v1/share/:id

returns 404 if slot was not found

returns 422 if slot could not be unshared



### Parameters

Name : id *- required -*
Description : The id of the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=u2DRqImnXdy64xAsAjMU_YsiieQ
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/share/29</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/share/29&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=u2DRqImnXdy64xAsAjMU_YsiieQ&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 9a1306cc-a366-487c-860b-68865eda43f3
X-Runtime: 0.007440
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

