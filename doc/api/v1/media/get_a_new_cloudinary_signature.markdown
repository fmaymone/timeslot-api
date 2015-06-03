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

<pre class="request">curl &quot;http://localhost:5000/v1/media-signature&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5b9d0a230e7184a36271265f954f0b60&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4d4c1682-9b32-4e43-ade5-787a16059969
X-Runtime: 0.031087
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "a6e54743953ad57a7e7765486dd7b973a783e3e9",
  "apiKey" : 255241985667644,
  "publicId" : "hdk1ntrakoqmtthoiwhh",
  "timestamp" : "20150603103937"
}
```
