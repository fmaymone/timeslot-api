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
Authorization: Token token=XL-k2U26W5EdLH_pvoluLZvLsww
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/35/pdf</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/share/35/pdf&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=XL-k2U26W5EdLH_pvoluLZvLsww&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;c3acad34488b4e64ce77ada197280640&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1b833924-b98d-47f8-8f5c-0be161341ca0
X-Runtime: 1.934015
Content-Length: 52</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
