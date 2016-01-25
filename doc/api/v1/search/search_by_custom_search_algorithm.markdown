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
Authorization: Token token=pz9SPbVkf6YiKJDVstnjF-YcYu0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=jon+do&amp;method=metaphone</pre>

#### Query Parameters

<pre>query: jon do
method: metaphone</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=jon+do&amp;method=metaphone&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=pz9SPbVkf6YiKJDVstnjF-YcYu0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c288865b4c4fb01518ed8f2d4f669507&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 916abc10-6d3b-4f70-9661-4a403617b4a3
X-Runtime: 0.013784
Vary: Origin
Content-Length: 337</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 164,
    "username" : "John Doe",
    "createdAt" : "2016-01-05T13:32:46.584Z",
    "updatedAt" : "2016-01-05T13:32:46.584Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 165,
    "username" : "John Doh",
    "createdAt" : "2016-01-05T13:32:46.587Z",
    "updatedAt" : "2016-01-05T13:32:46.587Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
