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
Authorization: Token token=DBD_AVeWCSFDwdjPm_PJvm3J8yM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/me/remove_friends</pre>

#### Body
```javascript
{
  "ids" : [
    98,
    99,
    100,
    97
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/remove_friends&quot; -d &#39;{&quot;ids&quot;:[98,99,100,97]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=DBD_AVeWCSFDwdjPm_PJvm3J8yM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 1efa7409-2e33-41aa-8ce8-a655abefbf28
X-Runtime: 0.142986
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

