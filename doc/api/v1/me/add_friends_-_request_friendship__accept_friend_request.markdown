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
Authorization: Token token=h0mV1be05GuFRpImAkdLx8-k0Rs
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/me/add_friends</pre>

#### Body
```javascript
{
  "ids" : [
    85,
    87,
    91,
    88,
    89,
    90
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/add_friends&quot; -d &#39;{&quot;ids&quot;:[85,87,91,88,89,90]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=h0mV1be05GuFRpImAkdLx8-k0Rs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 8e4f14c6-06c6-4090-92a1-727878c31f9a
X-Runtime: 0.092705
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

