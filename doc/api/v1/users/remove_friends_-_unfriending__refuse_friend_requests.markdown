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
Authorization: Token token=O0xPVS1qR2ZHvLgIfMC70KvcGq4
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/remove_friends</pre>

#### Body
```javascript
{
  "ids" : [
    306,
    307,
    308,
    305
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/remove_friends&quot; -d &#39;{&quot;ids&quot;:[306,307,308,305]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=O0xPVS1qR2ZHvLgIfMC70KvcGq4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 30bdaf4d-7303-47a1-b0d5-550b91bd065a
X-Runtime: 0.025363
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

