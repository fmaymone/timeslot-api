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
ETag: W/&quot;cc05989cc8af6694b6fe3f75e81c044b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e5d08a5b-1077-492f-a59a-945762bb793c
X-Runtime: 0.046455
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "42ad0d81e0823ff88eacabe6a0d1781ce4e5c1b7",
  "apiKey" : 615731726882135,
  "publicId" : "tx8nfxdhpyoxetwby8ek",
  "timestamp" : "20150702123418"
}
```
