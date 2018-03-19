# Search API

## Search by custom search algorithm

### GET /v1/search/user

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search

Name : method
Description : The custom search algorithm


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
Authorization: Token token=d-kq7VY6bAJFbNBmhxwEx2pxL18
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=jon+do&amp;method=metaphone</pre>

#### Query Parameters

<pre>query: jon do
method: metaphone</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/search/user?query=jon+do&amp;method=metaphone&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=d-kq7VY6bAJFbNBmhxwEx2pxL18&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;643070789b61cfad1c05bc5145bd1341&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5c613f2e-d247-45a3-b575-c14c50280422
X-Runtime: 0.025633
Content-Length: 439</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
