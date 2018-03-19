# Share API

## Share Slot as Image

### POST /v1/share/:id/image

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
Authorization: Token token=VSojbvMIAxgyFevEZUczPTdaa7M
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/35/image</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/share/35/image&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=VSojbvMIAxgyFevEZUczPTdaa7M&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;98d9d047c5914c9b3ccb6ed8e9e3202c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 29e4eb4b-30b1-4253-81ab-7d5af5d45533
X-Runtime: 1.900735
Content-Length: 52</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
