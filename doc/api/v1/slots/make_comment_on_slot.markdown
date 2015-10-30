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
Authorization: Token token=FEbVyDvGKtl7gtRIm65aATh2qq8
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/19/comment</pre>

#### Body
```javascript
{
  "content" : "Liebe ist ein Kind der Freiheit"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/19/comment&quot; -d &#39;{&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=FEbVyDvGKtl7gtRIm65aATh2qq8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: a00b4516-65e2-487d-b1c1-48ff1e6b2b11
X-Runtime: 0.016919
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

