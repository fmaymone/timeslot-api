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
Authorization: Token token=yqyXcc_xuFVJDKVlEk8krJX6wVw
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/30/qrcode</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/share/30/qrcode&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=yqyXcc_xuFVJDKVlEk8krJX6wVw&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0be19bd4c7b685f0442a7f4ed3fa2721&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6c42f859-db3f-484c-9dc1-ac2aac3538d5
X-Runtime: 0.424089
Vary: Origin
Content-Length: 69</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "shareId" : "MjozMA",
  "shareUrl" : "http://localhost:3000/v1/?id=MjozMA"
}
```
