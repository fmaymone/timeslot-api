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
ETag: W/&quot;f3c5350c3ea70deba211a8276739f6f5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8ade47e9-dd47-43f4-bb9c-bc3bd9106a74
X-Runtime: 0.024800
Vary: Origin
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "bab44def3b83b07632c293b5f8218d66ce9a8a17",
  "apiKey" : 255241985667644,
  "publicId" : "sxlni2c61xg5jak5n9rm",
  "timestamp" : "20151223111833"
}
```
