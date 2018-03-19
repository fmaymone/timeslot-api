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

<pre>Authorization: Token token=XEo-lXyh7nu8rmr3R5aqASbCpRU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/118/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/118/media&quot; -X GET \
	-H &quot;Authorization: Token token=XEo-lXyh7nu8rmr3R5aqASbCpRU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;54695d0cbffc1781bbf0ba287873b18e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 100a1041-42b8-436f-b5fe-7f88e347c023
X-Runtime: 0.064894
Content-Length: 2817</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
