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
Authorization: Token token=DWBQ2Xfuxr0hAlF9IvybfkE0lTs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=john+doe</pre>

#### Query Parameters

<pre>query: john doe</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/search/user?query=john+doe&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=DWBQ2Xfuxr0hAlF9IvybfkE0lTs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;5a5bb3dd812dcc1601a1a441561c5d89&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e83ffd29-f443-4794-9820-187bec563303
X-Runtime: 0.032754
Content-Length: 220</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
