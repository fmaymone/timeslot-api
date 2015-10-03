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
ETag: W/&quot;73ef2a39f003f3f90e8c7cb90648acea&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 62ab7422-8628-4e6e-9d7c-4589a6789a79
X-Runtime: 0.017858
Vary: Origin
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "d688afae37dae44a41ed7faa04225871c2914c2f",
  "apiKey" : 255241985667644,
  "publicId" : "plcwb6dsn69hbocwvtmk",
  "timestamp" : "20151003223041"
}
```
