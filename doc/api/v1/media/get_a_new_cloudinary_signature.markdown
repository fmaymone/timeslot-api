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
ETag: &quot;c2b0cd97f463ea36ebf551331c9fd4b8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 21dbe0db-daef-4a9a-90ac-ac0ca2fd5473
X-Runtime: 0.014308
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "06caa1111a8cad96b8b2c5b48a5851eee3186eca",
  "apiKey" : 255241985667644,
  "publicId" : "rcaz4q9pgww0ymxaasu6",
  "timestamp" : "20150506212932"
}
```
