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
Authorization: Token token=v02nkwwtQj4AQu5_GyZ5WQr9dM0
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/29/image</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/share/29/image&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=v02nkwwtQj4AQu5_GyZ5WQr9dM0&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;63b07adc2ec846199e548f4017e20c33&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 260cec71-31e4-4044-8d11-3f4b286a0c92
X-Runtime: 1.735681
Vary: Origin
Content-Length: 52</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "shareId" : "MzoyOQ==",
  "shareUrl" : "/v1/?id=MzoyOQ=="
}
```
