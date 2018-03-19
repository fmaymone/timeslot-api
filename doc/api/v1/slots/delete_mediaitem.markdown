# Slots API

## Delete MediaItem

### DELETE /v1/slots/:id/media

returns 404 if ID is invalid

returns 422 if parameter was missing or is invalid

### Parameters

Name : id *- required -*
Description : ID of the Standard Slot where the media belongs to

Name : media *- required -*
Description : Array of the Media Items to delete

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=mLLnMEzdkqlC_Jgjy04Q7raRpt8
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/19/media</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/19/media&quot; -d &#39;{&quot;media&quot;:[{&quot;id&quot;:16},{&quot;id&quot;:15},{&quot;id&quot;:14},{&quot;id&quot;:13},{&quot;id&quot;:12},{&quot;id&quot;:11}]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=mLLnMEzdkqlC_Jgjy04Q7raRpt8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 071d4877-9096-4142-ac0b-edda992a256a
X-Runtime: 0.510546
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

