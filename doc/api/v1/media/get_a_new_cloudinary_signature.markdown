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
ETag: W/&quot;d5565acb1a537f5c1cee32d3673e5bb3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e08e9e30-cf86-4a0e-a8c0-367114558ce2
X-Runtime: 0.039445
Vary: Origin
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "b4f020669ef1634bb6c2baec7264a6ed8a588643",
  "apiKey" : 255241985667644,
  "publicId" : "e4fspnf11vqqmyeiiyvw",
  "timestamp" : "20151117121238"
}
```
