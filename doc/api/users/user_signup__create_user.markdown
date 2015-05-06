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

<pre>{
  "username" : "foo",
  "email" : "someone@timeslot.com",
  "password" : "secret-thing"
}</pre>

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
ETag: &quot;9801ddf7d8f6086c2c3c0ad4ca893c62&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f5cc10c7-66a9-49c9-93c9-acfdced44b1c
X-Runtime: 0.008073
Content-Length: 100</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "id" : 212,
  "username" : "foo",
  "email" : "someone@timeslot.com",
  "authToken" : "uXiAmsMk_yn1YGKIR9_EfzwadmA"
}</pre>
