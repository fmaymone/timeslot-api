# Slots API

## Make Comment on Slot

### POST /v1/slots/:id/comment

Current user makes a comment on a slot.

### Parameters

Name : id *- required -*
Description : ID of the Slot to make a comment on

Name : content *- required -*
Description : Content of the comment

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=0ynvDjqoqLFlLuYaPQmoBQFp4O4
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/47/comment</pre>

#### Body
```javascript
{
  "content" : "Liebe ist ein Kind der Freiheit"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/47/comment&quot; -d &#39;{&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=0ynvDjqoqLFlLuYaPQmoBQFp4O4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 2c950b9e-bc59-4b74-b308-8b8760b216e7
X-Runtime: 0.010868
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

