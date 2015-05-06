# Groups API

## Accept Invitation and add invited user to group

### POST /v1/groups/:group_id/accept

returns 200 if invite successfully accepted

returns 403 if invitation is missing

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=H6F3X0rSgEcoAZq_89JNLlU2w-o
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/23/accept</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/23/accept&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=H6F3X0rSgEcoAZq_89JNLlU2w-o&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
ETag: &quot;7215ee9c7d9dc229d2921a40e899ec5f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e46d931d-4d2f-446d-b2fa-8f6f119aad83
X-Runtime: 0.012043
Content-Length: 1</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
 
```
