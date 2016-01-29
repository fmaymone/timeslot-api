# Share API

## Share Slot as PDF

### POST /v1/share/:id/pdf

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
Authorization: Token token=9roqMcmwOKa2fjjX9cu_HqUOBb0
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/30/pdf</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/share/30/pdf&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=9roqMcmwOKa2fjjX9cu_HqUOBb0&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;cf0997c37972716738a2dfd0d166e5c5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6d199665-4998-4575-b785-8826a76ea653
X-Runtime: 1.908255
Vary: Origin
Content-Length: 69</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "shareId" : "NDozMA",
  "shareUrl" : "http://localhost:3000/v1/?id=NDozMA"
}
```
