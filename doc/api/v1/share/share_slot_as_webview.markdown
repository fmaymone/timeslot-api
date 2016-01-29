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
Authorization: Token token=uQSxU5hsiofzXhRxNb8paxoIWdw
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/30/webview</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/share/30/webview&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=uQSxU5hsiofzXhRxNb8paxoIWdw&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7700a496c28898021286003f2f627724&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 09a58844-83a6-4546-93e9-42880fd11552
X-Runtime: 0.076850
Vary: Origin
Content-Length: 69</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "shareId" : "MDozMA",
  "shareUrl" : "http://localhost:3000/v1/?id=MDozMA"
}
```
