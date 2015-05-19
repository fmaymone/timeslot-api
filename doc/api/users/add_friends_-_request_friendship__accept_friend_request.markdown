# Users API

## Add Friends - Request Friendship / Accept Friend Request

### POST /v1/users/add_friends

Receives a list of User IDs for which a friendshipwith the current user will be created.

This corresponds to a &#39;Friend Request&#39;.

If the friendship was already initiated by the other User it will be accepted.



### Parameters

Name : ids *- required -*
Description : Array of User IDs to create a friendship for

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=3-Xv7PerTHNpp8kFYKA5R41_e2A
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/add_friends</pre>

#### Body
```javascript
{
  "ids" : [
    297,
    299,
    303,
    300,
    301,
    302
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/add_friends&quot; -d &#39;{&quot;ids&quot;:[297,299,303,300,301,302]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=3-Xv7PerTHNpp8kFYKA5R41_e2A&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 34b1c655-52e2-4862-8789-92f68b705197
X-Runtime: 0.045538
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

