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
Authorization: Token token=887PWjoQYzbXIsg_jdinaDtRyY0
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/29/email</pre>

#### Body
```javascript
{
  "email" : "test@timeslot.com"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/share/29/email&quot; -d &#39;{&quot;email&quot;:&quot;test@timeslot.com&quot;}&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=887PWjoQYzbXIsg_jdinaDtRyY0&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: c12d96f8-5476-4ea4-9715-783b72b81000
X-Runtime: 0.018838
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

