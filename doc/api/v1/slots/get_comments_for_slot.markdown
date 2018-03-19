# Slots API

## Get Comments for Slot

### GET /v1/slots/:id/comments

returns a list of all comments for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see Comments data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the comments for


### Response Fields

Name : array
Description : containing comment content and creation date and details of the user who made the comment

### Request

#### Headers

<pre>Authorization: Token token=g6_wLg1aMBSkiz7Tc4jz5JCC7aM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/32/comments</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/32/comments&quot; -X GET \
	-H &quot;Authorization: Token token=g6_wLg1aMBSkiz7Tc4jz5JCC7aM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;eed4de9a5313de815ee93803663278d1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 63b43f60-012d-4d2c-a0b4-411257e29228
X-Runtime: 0.027118
Content-Length: 850</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
