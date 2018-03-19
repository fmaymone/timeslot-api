# Search API

## Search by media title

### GET /v1/search/media

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search


### Response Fields

Name : signature
Description : Signature for cloudinary upload

Name : pulicId
Description : ID for the resource to be uploaded

Name : timestamp
Description : Timestamp

Name : apiKey
Description : API Key

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=YxlBirjkYqLzTchgUfuZa4GZAdo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=YxlBirjkYqLzTchgUfuZa4GZAdo&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;0303607b4cf89559eef379b5a365f23d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 52c30588-da91-455b-afe6-4d85e4fab751
X-Runtime: 0.014996
Content-Length: 173</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
