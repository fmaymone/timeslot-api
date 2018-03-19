# Users API

## Get media items for Stranger

### GET /v1/users/:id/media

Returns an array which includes all public media items of a specific user and media items this user has added to common groups.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=qhjzrTmRdJUicR9AyGxiVDWISAg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/131/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/131/media&quot; -X GET \
	-H &quot;Authorization: Token token=qhjzrTmRdJUicR9AyGxiVDWISAg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;2053c4da4b334288ad3343e1c2aceb23&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 32b4d1f3-f827-4058-bc4e-c0f224107eb3
X-Runtime: 0.034662
Content-Length: 937</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
