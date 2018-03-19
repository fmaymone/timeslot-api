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

<pre>Authorization: Token token=kXpzSRmryXxA2-0QXJvsOTi_M60
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/124/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/124/media&quot; -X GET \
	-H &quot;Authorization: Token token=kXpzSRmryXxA2-0QXJvsOTi_M60&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;2db5028e904702c774dff06148e55109&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b6f8b182-5502-4eb7-998c-75fe9dc07da8
X-Runtime: 0.048338
Content-Length: 1875</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
