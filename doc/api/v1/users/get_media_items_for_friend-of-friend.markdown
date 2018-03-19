# Users API

## Get media items for Friend-of-Friend

### GET /v1/users/:id/media

Returns an array which includes all media items of the friend which are public- or foaf-visible and if users have shared groups also the media items which the friend has added to this group.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=NdcFwIh1pu42SAqOECSNgP7Br8E
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/122/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/122/media&quot; -X GET \
	-H &quot;Authorization: Token token=NdcFwIh1pu42SAqOECSNgP7Br8E&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;700fb36b1895d621746fa1b9738b9773&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ffdd68f6-6e22-4ec5-9d68-a107998df3b3
X-Runtime: 0.047513
Content-Length: 1875</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
