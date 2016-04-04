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
Authorization: Token token=D5g9rCmRGNpQrtnYx2EJZRLm1hY
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/29/pdf</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/share/29/pdf&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=D5g9rCmRGNpQrtnYx2EJZRLm1hY&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9592fe737779522aa70331b39184a345&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1beac579-ab0f-404d-915f-5f4409cae32e
X-Runtime: 1.479189
Vary: Origin
Content-Length: 52</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "shareId" : "NDoyOQ==",
  "shareUrl" : "/v1/?id=NDoyOQ=="
}
```
