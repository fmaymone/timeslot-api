# Media API

## Get a new cloudinary signature

### GET /v1/media-signature

Cloundinary signed parameters to be used for client side image or raw data (voice/video) upload.

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

<pre class="request">curl &quot;http://localhost:3000/v1/media-signature&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d17a0d2a1239d5bc73e2e777362b7081&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d097bfd6-6d27-475f-80f9-950365e39a31
X-Runtime: 0.014528
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "5b0a48630c0f8b42e40c551dbffe2ce6a182aa62",
  "apiKey" : 255241985667644,
  "publicId" : "xorw21eawrlqg01hgdiv",
  "timestamp" : "20150519105150"
}
```
