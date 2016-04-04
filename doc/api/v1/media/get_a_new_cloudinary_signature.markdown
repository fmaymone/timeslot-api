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
ETag: W/&quot;17591c41b3d0c20b9cff927050354b74&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e2c3deea-b035-43d0-9e34-125836b8a52b
X-Runtime: 0.026159
Vary: Origin
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "7d017acf80557fd4c90888092209959fb5d698e3",
  "apiKey" : 255241985667644,
  "publicId" : "vg8k3lnwk8lent1txise",
  "timestamp" : "20160404205025"
}
```
