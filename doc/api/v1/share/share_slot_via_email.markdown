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
Authorization: Token token=csTCGaSfnf-iB8beUgGALxC6qCM
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/35/email</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/share/35/email&quot; -d &#39;{&quot;email&quot;:&quot;success@simulator.amazonses.com&quot;}&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=csTCGaSfnf-iB8beUgGALxC6qCM&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 853356bf-1eb5-46dc-907e-3800d3728088
X-Runtime: 0.049503
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

