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
Authorization: Token token=DKuSJKbE708T-NVoCTZpvmEDINA
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/remove_friends</pre>

#### Body
```javascript
{
  "ids" : [
    259,
    260,
    261,
    258
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/remove_friends&quot; -d &#39;{&quot;ids&quot;:[259,260,261,258]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=DKuSJKbE708T-NVoCTZpvmEDINA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 69af6cbb-7e27-4ae1-bdfd-7c58c5bdca5e
X-Runtime: 0.025328
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

