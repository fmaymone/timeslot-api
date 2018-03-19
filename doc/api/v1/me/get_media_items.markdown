# Me API

## Get media items

### GET /v1/me/media

Returns an array which includes all media items of the current user.

### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=OIKYpsn9wUrOqeTDoHoOEXZyn5s
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/media&quot; -X GET \
	-H &quot;Authorization: Token token=OIKYpsn9wUrOqeTDoHoOEXZyn5s&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;319bebb2e6d174c0898bcdfa7dbc8269&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6184525b-f973-4276-968b-dba1bc5340aa
X-Runtime: 0.018040
Content-Length: 1866</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
