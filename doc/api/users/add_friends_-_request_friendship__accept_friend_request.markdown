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
Authorization: Token token=hTM8TxbC26hAjZFWUNOOVWpyQjA
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/add_friends</pre>

#### Body

<pre>{
  "ids" : [
    284,
    286,
    290,
    287,
    288,
    289
  ]
}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/add_friends&quot; -d &#39;{&quot;ids&quot;:[284,286,290,287,288,289]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=hTM8TxbC26hAjZFWUNOOVWpyQjA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
ETag: &quot;7215ee9c7d9dc229d2921a40e899ec5f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 32439c59-c9bb-4c7c-b8a4-05473f6740b6
X-Runtime: 0.039306
Content-Length: 1</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre> </pre>
