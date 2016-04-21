# Share API

## Share Slot as iFrame

### POST /v1/share/:id/iframe

returns 404 if slot was not found

returns 422 if slot could not be shared



### Parameters

Name : id *- required -*
Description : The id of the slot


### Response Fields

Name : shareId
Description : The plain share ID

Name : shareUrl
Description : The full share link including the share ID

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=EdCZ8clNTHo9xI-81CW8I12kQdI
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/29/iframe</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/share/29/iframe&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=EdCZ8clNTHo9xI-81CW8I12kQdI&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;91d87348b762ef389e931f2753da9f9b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c62ca449-704a-4d88-8940-a1b47326b234
X-Runtime: 0.033707
Vary: Origin
Content-Length: 73</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
