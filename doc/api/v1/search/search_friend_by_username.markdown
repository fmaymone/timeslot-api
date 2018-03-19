# Search API

## Search friend by username

### GET /v1/search/friend

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : image
Description : URL of the user image

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : friendshipState
Description : The friendship relation to the current user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=Wur0_B4zkguT6WORrA0LDTuwGL4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/friend?query=john</pre>

#### Query Parameters

<pre>query: john</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/search/friend?query=john&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Wur0_B4zkguT6WORrA0LDTuwGL4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;2508c9d0d17040703b96ec7be3e0ab8e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0eef12ea-224a-4a3a-9015-a9de97c25c62
X-Runtime: 0.026633
Content-Length: 218</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
