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

<pre>Authorization: Token token=0czT7Bsp0sFadXIPnZw5gl7FqVw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/116/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/116/media&quot; -X GET \
	-H &quot;Authorization: Token token=0czT7Bsp0sFadXIPnZw5gl7FqVw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;0bf86f2afed2c1e76bac19774cceb899&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6226fe3c-4fb2-49de-a028-103b8eefa7e0
X-Runtime: 0.047780
Content-Length: 2817</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
