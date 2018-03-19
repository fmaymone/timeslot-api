# Slots API

## Get Likes for Slot

### GET /v1/slots/:id/likes

returns a list of all likes for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see Likes data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the likes for


### Response Fields

Name : array
Description : containing creation date of the Like and details of the user who made the Like

### Request

#### Headers

<pre>Authorization: Token token=1n7z87_8rYvutbMVXjeihH2htic
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/29/likes</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/29/likes&quot; -X GET \
	-H &quot;Authorization: Token token=1n7z87_8rYvutbMVXjeihH2htic&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;66740244d02d2de49cf798bd76e3b9aa&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: abeb1984-f9d6-4ca1-81f4-7fd437f51c4e
X-Runtime: 0.015336
Content-Length: 953</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
