# Users API

## User signin

### POST /v1/users/signin

returns OK and an AuthToken if credentials match

returns 403 if credentials invalid

### Parameters

Name : email *- required -*
Description : Email of the user to authenticate

Name : password *- required -*
Description : Password for the user to authenticate


### Response Fields

Name : authToken
Description : Authentication Token for the user to be set as a HTTP header in subsequent requests

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/signin</pre>

#### Body
```javascript
{
  "email" : "user56@email.com",
  "password" : "timeslot"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/signin&quot; -d &#39;{&quot;email&quot;:&quot;user56@email.com&quot;,&quot;password&quot;:&quot;timeslot&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;131ab22825bf88341a3f92905b69c475&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 013f83fe-8cce-48aa-9352-8855c1697ad2
X-Runtime: 0.080050
Content-Length: 101</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 213,
  "username" : "User 212",
  "email" : "user56@email.com",
  "authToken" : "fa8Cxy7_jyWTiO6qQo9CXLzLvTA"
}
```
