# Users API

## User signup / Create user

### POST /v1/users

Either an email or phone number must be provided

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : username *- required -*
Description : Username of user (max. 50 characters)

Name : email
Description : Email of user (max. 254 characters)

Name : phone
Description : Phone number of user (max. 35 characters)

Name : password *- required -*
Description : Password for user (min. 5 &amp; max. 72 characters)


### Response Fields

Name : id
Description : ID of the new user

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users</pre>

#### Body
```javascript
{
  "username" : "foo",
  "email" : "someone@timeslot.com",
  "password" : "secret-thing"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users&quot; -d &#39;{&quot;username&quot;:&quot;foo&quot;,&quot;email&quot;:&quot;someone@timeslot.com&quot;,&quot;password&quot;:&quot;secret-thing&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;6d8eb78ed21630fd367a56f6498e7684&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 86e05dda-217b-40ee-8cd9-c5aa177bd5d7
X-Runtime: 0.079812
Content-Length: 100</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 212,
  "username" : "foo",
  "email" : "someone@timeslot.com",
  "authToken" : "NyTiZrYqaJp07D3WeSQWq1kPRxY"
}
```
