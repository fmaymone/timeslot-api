# Search API

## Search by username

### GET /v1/search/user

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
Authorization: Token token=AWTnDKLa4L6Qvodo2fAi5UjXZaw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=john+doe</pre>

#### Query Parameters

<pre>query: john doe</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/search/user?query=john+doe&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=AWTnDKLa4L6Qvodo2fAi5UjXZaw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;e2d991ae6e37e017e7b62c9b4e616b21&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ebc3926e-b5db-416b-8bba-b53e85ac7c17
X-Runtime: 0.035424
Content-Length: 220</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
