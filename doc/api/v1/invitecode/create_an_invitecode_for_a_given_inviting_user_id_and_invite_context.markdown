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
Authorization: Token token=kzQPcGilm0UtiAZczmDRqyy9aYo
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/invitecodes</pre>

#### Body
```javascript
{
  "userId" : 3,
  "context" : "SomeContext"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/invitecodes&quot; -d &#39;{&quot;userId&quot;:3,&quot;context&quot;:&quot;SomeContext&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=kzQPcGilm0UtiAZczmDRqyy9aYo&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;8d25e0fdd3e0978a22b5ea5af1d1cc99&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 70e40614-52c4-436e-9f43-d84a058df0b1
X-Runtime: 0.012128
Content-Length: 24</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 3,
  "code" : "052815"
}
```
