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
Authorization: Token token=UcTWz7ViqJss48griiUIUdK_NkM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/remove_friends</pre>

#### Body

<pre>{
  "ids" : [
    293,
    294,
    295,
    292
  ]
}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/remove_friends&quot; -d &#39;{&quot;ids&quot;:[293,294,295,292]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=UcTWz7ViqJss48griiUIUdK_NkM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
ETag: &quot;7215ee9c7d9dc229d2921a40e899ec5f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 92c0129d-6884-4633-8a9f-c7a61be53b7a
X-Runtime: 0.021025
Content-Length: 1</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre> </pre>
