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
Authorization: Token token=7EBWzSSKYomkln6XgRbjZSZ1F1Y
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/me/add_friends</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/add_friends&quot; -d &#39;{&quot;ids&quot;:[93,95,99,96,97,98]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=7EBWzSSKYomkln6XgRbjZSZ1F1Y&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 4eac7453-e407-482e-b369-5e15504b5a7f
X-Runtime: 0.269156
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

