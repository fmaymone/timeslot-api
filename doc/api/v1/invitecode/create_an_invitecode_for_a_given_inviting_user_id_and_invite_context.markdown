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
Authorization: Token token=-Xh5wDpyNKD52odx4P4FZOciC2w
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/invitecodes</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/invitecodes&quot; -d &#39;{&quot;userId&quot;:3,&quot;context&quot;:&quot;SomeContext&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=-Xh5wDpyNKD52odx4P4FZOciC2w&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6c77fe85fd0bbea6c33fcebf7d60335b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d90bf7e4-9ab1-4519-abe2-e5d0072da3b2
X-Runtime: 0.031831
Vary: Origin
Content-Length: 24</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript

```
