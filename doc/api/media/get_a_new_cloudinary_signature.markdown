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
ETag: &quot;4db02ecbfbcfddd7d0ee6d0fc9f86da9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c95f21fc-b142-4e90-9437-5dd0f57366dd
X-Runtime: 0.012116
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "signature" : "fe307e1bb905fbab243081b8bd768ca1a0b9ee2e",
  "apiKey" : 255241985667644,
  "publicId" : "bzvb1jbjyqomwtjvoksc",
  "timestamp" : "20150506144515"
}</pre>
