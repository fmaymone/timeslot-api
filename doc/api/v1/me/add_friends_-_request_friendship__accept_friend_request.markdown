# Me API

## Add Friends - Request Friendship / Accept Friend Request

### POST /v1/me/add_friends

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
Authorization: Token token=nxifErHwJUHWRpBiTBnPkzOKj1E
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/me/add_friends</pre>

#### Body
```javascript
{
  "ids" : [
    142,
    144,
    148,
    145,
    146,
    147
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/add_friends&quot; -d &#39;{&quot;ids&quot;:[142,144,148,145,146,147]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=nxifErHwJUHWRpBiTBnPkzOKj1E&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 1f991e05-1492-4966-9f00-b8d0b7a05077
X-Runtime: 0.169593
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

