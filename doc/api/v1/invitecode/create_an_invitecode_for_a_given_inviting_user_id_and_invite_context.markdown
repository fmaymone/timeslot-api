# Invitecode API

## Create an invitecode for a given inviting user id and invite context

### POST /v1/invitecodes

Returns 201 and invitecode string in object

### Parameters

Name : userId *- required -*
Description : ID of inviting user

Name : context *- required -*
Description : Context in which the invite took place, eg. EmailOnIos, Student, etc.


### Response Fields

Name : id
Description : ID of invitecode

Name : code
Description : Invitecode string

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=l7UdVv_0QPyrmN6mO2C3BoFT520
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/invitecodes</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/invitecodes&quot; -d &#39;{&quot;userId&quot;:3,&quot;context&quot;:&quot;SomeContext&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=l7UdVv_0QPyrmN6mO2C3BoFT520&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1b6dd19927a66872253494f5698be6f9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: be7a7004-63d8-44f3-9362-adb4244b1b59
X-Runtime: 0.016914
Content-Length: 24</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript

```
