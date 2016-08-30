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

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/media-signature&quot; -X GET \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;f7fd0730b7b4ebaa93beff66cb5e9d76&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8c2bf0e8-2c26-4cd8-a562-b2307c22741b
X-Runtime: 0.033100
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "8cb8d906c34897d23e425feb3a33dcaea8638716",
  "apiKey" : 255241985667644,
  "publicId" : "rzac9dw6l38cuhqooiht",
  "timestamp" : "20160830095055"
}
```
