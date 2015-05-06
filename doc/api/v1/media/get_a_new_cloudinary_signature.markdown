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
ETag: &quot;7d32f87d68d34a819adfdb6501958bf7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 37339d36-ca31-4e96-94d7-3210e833486b
X-Runtime: 0.027553
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "signature" : "3971a2e8a63f3b953b2478300bdd695fb43fd6e2",
  "apiKey" : 255241985667644,
  "publicId" : "xnhjval54vrwsfzm2jkg",
  "timestamp" : "20150506112850"
}</pre>
