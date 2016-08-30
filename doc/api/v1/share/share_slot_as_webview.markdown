# Share API

## Share Slot as Webview

### POST /v1/share/:id/webview

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
Authorization: Token token=-5J95t3TNdHjuNM7jej5rmlY5cM
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/29/webview</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/share/29/webview&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=-5J95t3TNdHjuNM7jej5rmlY5cM&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;0197d02df4c506001c573e4b67555c0b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 93f64c98-627f-4c06-9351-ad7e56e08f3f
X-Runtime: 0.077341
Content-Length: 52</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "shareId" : "MDoyOQ==",
  "shareUrl" : "/v1/?id=MDoyOQ=="
}
```
