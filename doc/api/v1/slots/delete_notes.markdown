# Slots API

## Delete Notes

### DELETE /v1/slots/:id/notes

returns 404 if ID is invalid

returns 422 if parameter was missing or is invalid

### Parameters

Name : id *- required -*
Description : ID of the Standard Slot where the notes belongs to

Name : notes *- required -*
Description : Array of the Notes to delete

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=fkq7KHAWofoZUJ8zko4_FbpJJBk
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/21/notes</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/21/notes&quot; -d &#39;{&quot;notes&quot;:[{&quot;id&quot;:13},{&quot;id&quot;:12},{&quot;id&quot;:11}]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=fkq7KHAWofoZUJ8zko4_FbpJJBk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 20339a4a-b6f9-4f9f-8d9e-5e4cabc20405
X-Runtime: 0.103851
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

