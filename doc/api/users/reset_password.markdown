# Users API

## Reset password

### POST /v1/users/reset

This is not ready for production!!!

Resets password to &#39;autechre&#39;

returns OK if valid email

returns 403 if invalid email

### Parameters

Name : email *- required -*
Description : Email of the user for whom to reset password

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/reset</pre>

#### Body

<pre>{"email":"user58@email.com"}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/reset&quot; -d &#39;{&quot;email&quot;:&quot;user58@email.com&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
ETag: &quot;7215ee9c7d9dc229d2921a40e899ec5f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1ab8bb67-5f5a-43bf-b266-7d306692a432
X-Runtime: 0.006485
Content-Length: 1</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre></pre>
### Request

#### Headers

<pre>Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST v1/users/signin</pre>

#### Body

<pre>email=user58%40email.com&password=autechre</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000v1/users/signin&quot; -d &#39;email=user58%40email.com&amp;password=autechre&#39; -X POST \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;2bd18267d05de2829af7e1b1b152287f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b62b8eef-888e-4089-9a70-9aef7b595eaa
X-Runtime: 0.007018
Content-Length: 101</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 215,
  "username" : "User 214",
  "email" : "user58@email.com",
  "authToken" : "5YnxtYtVz8oQkURuIXXtvW8g48I"
}</pre>
