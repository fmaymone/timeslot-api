# Invitecode API

## Try to get an invitecode object for a given invite code string

### GET /v1/invitecodes/:code

Returns 200 and invitecode object or 404 when code is not found.

### Parameters

Name : code *- required -*
Description : Invitecode string


### Response Fields

Name : id
Description : ID of invitecode

Name : context
Description : Context in which the invite took place, eg. EmailOnIos, Student, etc.

Name : userId
Description : ID of inviting user

### Request

#### Headers

<pre>Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/invitecodes/3a785c</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/invitecodes/3a785c&quot; -X GET \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;75e6f8fa8f27f23a79a1610a36e63ad5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e84718b6-6375-4555-b767-fc6e5ee5b297
X-Runtime: 0.053899
Vary: Origin
Content-Length: 40</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
