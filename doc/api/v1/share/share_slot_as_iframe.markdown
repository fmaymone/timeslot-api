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
Authorization: Token token=vpoPLD7wSFIUjQgj_QA3uBNGJHs
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/35/iframe</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/share/35/iframe&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=vpoPLD7wSFIUjQgj_QA3uBNGJHs&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;6d2e6896c2a19db266f7384b6d43fc5a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c6f6e80f-406e-4119-9b38-0c63ea7fdf82
X-Runtime: 0.057953
Content-Length: 52</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
