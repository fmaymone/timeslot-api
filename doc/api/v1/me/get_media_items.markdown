# Me API

## Get media items

### GET /v1/me/media

Returns an array which includes all media items of the current user.

### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=PzwSsTOVkr-9zIeBS5m8jphSOOQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/media&quot; -X GET \
	-H &quot;Authorization: Token token=PzwSsTOVkr-9zIeBS5m8jphSOOQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;cc5c412eaf8ee2764e1755bacac98f4c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 69093109-f026-4a0b-9621-b983c2de8b58
X-Runtime: 0.019700
Content-Length: 1866</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
