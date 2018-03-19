# Share API

## Share Slot as Webview

### POST /v1/share/:id/webview

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
Authorization: Token token=KfpHZ0Z6493DQpBVi05IbENXJu4
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/35/webview</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/share/35/webview&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=KfpHZ0Z6493DQpBVi05IbENXJu4&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;9e8002d140676515c5ef6d863d0d5a1c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 118b5e5d-6a26-4aa3-bbe6-f00058a787a3
X-Runtime: 0.114417
Content-Length: 52</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
