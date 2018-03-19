# Share API

## Share Slot as QR-Code

### POST /v1/share/:id/qrcode

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
Authorization: Token token=jRKidyPeURYAv4L9O7yNZLPnUqY
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/35/qrcode</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/share/35/qrcode&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=jRKidyPeURYAv4L9O7yNZLPnUqY&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;586262a6c6f78480d3817b9dabc4f645&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fa3c8dc5-c296-453b-8d49-d25e257c7635
X-Runtime: 0.252497
Content-Length: 52</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
