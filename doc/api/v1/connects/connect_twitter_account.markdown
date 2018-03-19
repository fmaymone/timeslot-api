# Connects API

## Connect twitter account

### POST /v1/tw-connect

User must be signed in, no existing connection to the submitted twitter account

returns 200 and the user data

### Parameters

Name : username *- required -*
Description : Username of user (max. 50 characters)

Name : socialId *- required -*
Description : Twitter ID of the user

Name : auth_token
Description : Twitter Auth Token

Name : auth_secret
Description : Twitter Auth Secret


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : image
Description : URL of the user image

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=rDkjfq1PapEhuP6p05pBhD9xpUc
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/tw-connect</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/tw-connect&quot; -d &#39;{&quot;username&quot;:&quot;alexandrospar&quot;,&quot;socialId&quot;:3186786310,&quot;auth_token&quot;:&quot;3186786310-OCKGioG9L94PwGc3Qjm4jIU6xIm1Bi5sWrl37xV&quot;,&quot;auth_secret&quot;:&quot;CAAFayXB6p6oBAChjrbg1RB6QoIdJyZasdfljk214C6k5x&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=rDkjfq1PapEhuP6p05pBhD9xpUc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;3a6f0b0093dc675dbd9a3257040835c5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e5a64902-2bea-4daf-a2f9-24753bd05f7e
X-Runtime: 0.036899
Content-Length: 861</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
