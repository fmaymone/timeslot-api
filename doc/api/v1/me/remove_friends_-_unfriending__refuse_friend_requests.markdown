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
Authorization: Token token=9OWIQNIST3cmiY4U2T2bwNbdqoM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/me/remove_friends</pre>

#### Body
```javascript
{
  "ids" : [
    161,
    162,
    163,
    160
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/remove_friends&quot; -d &#39;{&quot;ids&quot;:[161,162,163,160]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=9OWIQNIST3cmiY4U2T2bwNbdqoM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: f60b937a-7363-4636-8839-7ccbf352aeb9
X-Runtime: 0.026230
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

