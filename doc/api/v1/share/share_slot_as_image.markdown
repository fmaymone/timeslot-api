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
Authorization: Token token=hWvFidKsDJ4wovjfLj17fYqIOB4
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/32/image</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/share/32/image&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=hWvFidKsDJ4wovjfLj17fYqIOB4&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f64814dbe161a06fb5fbd37f4f144fa4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 45c77dbd-e617-4816-aa48-bc132912bce0
X-Runtime: 5.881423
Vary: Origin
Content-Length: 69</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "shareId" : "MzozMg",
  "shareUrl" : "http://localhost:3000/v1/?id=MzozMg"
}
```
