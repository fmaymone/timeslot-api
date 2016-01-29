# Media API

## Get a new cloudinary signature

### GET /v1/media-signature

Cloundinary signed parameters to be used for client side image, video or raw data (audio) upload.

### Response Fields

Name : signature
Description : Signature for cloudinary upload

Name : pulicId
Description : ID for the resource to be uploaded

Name : timestamp
Description : Timestamp

Name : apiKey
Description : API Key

### Request

#### Headers

<pre>Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/media-signature</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/media-signature&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3104e2a00fc761c747511b3d5c1c4897&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 25fa76f3-315a-4fd9-a361-a6d6769b94fb
X-Runtime: 0.031477
Vary: Origin
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "508533e6b61b89ec930047bf225bb596ba1806b2",
  "apiKey" : 628921522599727,
  "publicId" : "bf5n8pqy81jcs7uyoz5n",
  "timestamp" : "20160129193902"
}
```
