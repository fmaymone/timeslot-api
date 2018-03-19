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

<pre>Authorization: Token token=QMrjqNjw7deIN4H9L9l_SsT29_4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/131/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/131/media&quot; -X GET \
	-H &quot;Authorization: Token token=QMrjqNjw7deIN4H9L9l_SsT29_4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;6eef511d5860cb327ae094802656ada4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 86640c11-3c1b-4c3e-83c1-4283364726aa
X-Runtime: 0.064832
Content-Length: 937</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
