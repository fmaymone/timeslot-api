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
Authorization: Token token=zqgLoa4wV4ynuADFKXLWmNikNyY
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/30/image</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/share/30/image&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=zqgLoa4wV4ynuADFKXLWmNikNyY&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c651fca226a15d5ee44832daf4bfbb36&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f03ac8df-f94b-443e-82d6-1d629eaaa733
X-Runtime: 1.817761
Vary: Origin
Content-Length: 69</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "shareId" : "MzozMA",
  "shareUrl" : "http://localhost:3000/v1/?id=MzozMA"
}
```
