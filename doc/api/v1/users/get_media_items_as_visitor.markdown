# Users API

## Get media items as Visitor

### GET /v1/users/:id/media

Visitor means there is no current user.

Returns an array which includes all public media items of the specific user.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: 
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/137/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/137/media&quot; -X GET \
	-H &quot;Authorization: &quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;74791c8192b82326ab05750a3edd2cef&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1a279732-aa02-405e-ae47-ed0b493d77b1
X-Runtime: 0.019689
Content-Length: 938</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
