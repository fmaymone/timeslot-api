# Users API

## Remove Friends - Unfriending / Refuse Friend Requests

### POST /v1/users/remove_friends

Receives a list of User IDs for which a friendshipwith the current user will be refused or deleted.

returns 404 if an User ID is invalid

### Parameters

Name : ids *- required -*
Description : Array of User IDs for whom to refuse/destroy a friendship

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=mkKL-sxi0KWvxYp7434VfE29K7E
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/remove_friends</pre>

#### Body
```javascript
{
  "ids" : [
    490,
    491,
    492,
    489
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/remove_friends&quot; -d &#39;{&quot;ids&quot;:[490,491,492,489]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=mkKL-sxi0KWvxYp7434VfE29K7E&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 3c1acd29-1a4b-46ea-b720-eb93595a9478
X-Runtime: 0.032523
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

