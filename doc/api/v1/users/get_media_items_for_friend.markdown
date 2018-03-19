# Users API

## Get media items for Friend

### GET /v1/users/:id/media

Returns an array which includes all media items of the friend which are public-, friend- or foaf-visible and if users have shared groups also the media items which the friend has added to this group.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=-FufLvhr4CImkHMRu0e4jW6Xuiw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/118/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/118/media&quot; -X GET \
	-H &quot;Authorization: Token token=-FufLvhr4CImkHMRu0e4jW6Xuiw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;95fb465d54956c3184ead681268c9471&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b5a33a0c-26e7-4a7d-9fa4-0c1150c13e55
X-Runtime: 0.102074
Content-Length: 2817</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
