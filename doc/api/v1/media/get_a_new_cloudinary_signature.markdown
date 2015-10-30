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
ETag: W/&quot;99c97e4de04e9248dc36929de026115b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 98e4d602-146f-4e4c-888b-29e3cdeeed8e
X-Runtime: 0.018486
Vary: Origin
Content-Length: 144</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "signature" : "562dd7c3facffbdf929f4393465494b387e16787",
  "apiKey" : 255241985667644,
  "publicId" : "psbfhn6ul1gjkaifrrfr",
  "timestamp" : "20151030150102"
}
```
