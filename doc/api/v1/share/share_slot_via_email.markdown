# Share API

## Share Slot via Email

### POST /v1/share/:id/email

returns 404 if slot was not found

returns 422 if slot could not be shared



### Parameters

Name : id *- required -*
Description : The id of the slot

Name : email *- required -*
Description : The email of the recipient

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=xBMQbSsXFzeH8UjkI_4g-4zxFjI
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/29/email</pre>

#### Body
```javascript
{
  "email" : "success@simulator.amazonses.com"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/share/29/email&quot; -d &#39;{&quot;email&quot;:&quot;success@simulator.amazonses.com&quot;}&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=xBMQbSsXFzeH8UjkI_4g-4zxFjI&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: dffa2546-6e2a-4843-8775-d714921f47ac
X-Runtime: 0.042171
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

