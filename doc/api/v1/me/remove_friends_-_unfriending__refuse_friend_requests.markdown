# Me API

## Remove Friends - Unfriending / Refuse Friend Requests

### POST /v1/me/remove_friends

Receives a list of User IDs for which a friendship with the current user will be refused or deleted.

returns 404 if an User ID is invalid

### Parameters

Name : ids *- required -*
Description : Array of User IDs for whom to refuse/destroy a friendship

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=orpGgk1iK9UKS-YWOJN0HsheOJU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/me/remove_friends</pre>

#### Body
```javascript
{
  "ids" : [
    165,
    166,
    167,
    164
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/remove_friends&quot; -d &#39;{&quot;ids&quot;:[165,166,167,164]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=orpGgk1iK9UKS-YWOJN0HsheOJU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: bccaa3f0-11b4-404e-a9e5-b6040103f7d0
X-Runtime: 0.018650
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

