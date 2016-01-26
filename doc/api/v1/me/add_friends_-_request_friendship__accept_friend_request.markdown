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
Authorization: Token token=r_0pPH5lc5wTaa00H7X2osUHApc
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/me/add_friends</pre>

#### Body
```javascript
{
  "ids" : [
    144,
    146,
    150,
    147,
    148,
    149
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/add_friends&quot; -d &#39;{&quot;ids&quot;:[144,146,150,147,148,149]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=r_0pPH5lc5wTaa00H7X2osUHApc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 543ca5dd-24f7-4b2b-873e-1f8f85da0038
X-Runtime: 0.143609
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

