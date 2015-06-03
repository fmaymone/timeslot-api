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
Authorization: Token token=ypfMmSlQL8ehjt8WhJAdfjCXVXE
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/50/comment</pre>

#### Body
```javascript
{
  "content" : "Liebe ist ein Kind der Freiheit"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/50/comment&quot; -d &#39;{&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=ypfMmSlQL8ehjt8WhJAdfjCXVXE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 12b31ac5-9974-44f7-8728-1f6333a257d3
X-Runtime: 0.010834
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

