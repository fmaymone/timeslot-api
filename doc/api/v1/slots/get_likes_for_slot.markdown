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

<pre>Authorization: Token token=6AfslO4Q5XqbELWFfm3MYp1DetM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/29/likes</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/29/likes&quot; -X GET \
	-H &quot;Authorization: Token token=6AfslO4Q5XqbELWFfm3MYp1DetM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;22babb1b6db8c0d20bd9a97a83e51d38&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5b700932-e534-4e4e-8f43-a97514fd2ddf
X-Runtime: 0.022357
Content-Length: 953</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
