# Users API

## Remove Friends - Unfriending / Refuse Friend Requests

### POST /v1/users/remove_friends

Receives a list of User IDs for which a friendship with the current user will be refused or deleted.

returns 404 if an User ID is invalid

### Parameters

Name : ids *- required -*
Description : Array of User IDs for whom to refuse/destroy a friendship

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=etdOP-QHBRDvR5rKj4gmtoDMNCo
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/remove_friends</pre>

#### Body
```javascript
{
  "ids" : [
    260,
    261,
    262,
    259
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/remove_friends&quot; -d &#39;{&quot;ids&quot;:[260,261,262,259]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=etdOP-QHBRDvR5rKj4gmtoDMNCo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 568f3d10-d01c-4b6f-a312-a631c3ecfb14
X-Runtime: 0.028163
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

