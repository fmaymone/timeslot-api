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
Authorization: Token token=-POwtyUQvp59NfIz4tLMVHBGxOs
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/29/qrcode</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/share/29/qrcode&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=-POwtyUQvp59NfIz4tLMVHBGxOs&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;ca499aa70146a0b0b418d4d6f8935550&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 956ce52c-903d-4dda-b97f-0f16e3b83b47
X-Runtime: 0.217474
Content-Length: 52</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "shareId" : "MjoyOQ==",
  "shareUrl" : "/v1/?id=MjoyOQ=="
}
```
