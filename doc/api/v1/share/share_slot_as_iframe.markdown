# Share API

## Share Slot as iFrame

### POST /v1/share/:id/iframe

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
Authorization: Token token=j79-LGTGlkTW4mukjCE3psuagZQ
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/share/29/iframe</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/share/29/iframe&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=j79-LGTGlkTW4mukjCE3psuagZQ&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;7a81d8c7641665de844af9c49f8a63e2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 70ed25b2-e501-4e4b-bbfc-af8c27ddb007
X-Runtime: 0.055221
Content-Length: 52</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "shareId" : "NjoyOQ==",
  "shareUrl" : "/v1/?id=NjoyOQ=="
}
```
