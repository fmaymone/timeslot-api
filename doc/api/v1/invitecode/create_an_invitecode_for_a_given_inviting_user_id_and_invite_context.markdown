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
Authorization: Token token=GaZ0_2iftiyYpWgMXi7M1Cfe29A
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
	-H &quot;Authorization: Token token=GaZ0_2iftiyYpWgMXi7M1Cfe29A&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;a18ce98b671750ce0ca77440dd833943&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4eb87fb2-8ada-4c8c-9092-1ecc02c5c292
X-Runtime: 0.009530
Content-Length: 24</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 3,
  "code" : "daf9ae"
}
```
