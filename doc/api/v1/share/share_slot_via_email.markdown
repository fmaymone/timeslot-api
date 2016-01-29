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
Authorization: Token token=0jKjMZbGM7aNg_adSy1YXu-m4pU
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/30/email</pre>

#### Body
```javascript
{
  "email" : "test@timeslot.com"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/share/30/email&quot; -d &#39;{&quot;email&quot;:&quot;test@timeslot.com&quot;}&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=0jKjMZbGM7aNg_adSy1YXu-m4pU&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: c847a5f9-289d-4268-93c2-8681a53503fb
X-Runtime: 0.039497
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

