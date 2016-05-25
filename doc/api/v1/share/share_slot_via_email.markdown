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
Authorization: Token token=YyrbFe2UQ70W2Tpg9HXdalbQJec
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
	-H &quot;Authorization: Token token=YyrbFe2UQ70W2Tpg9HXdalbQJec&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: ead29fb1-60a6-4a44-8253-e7344a317274
X-Runtime: 0.011811
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

