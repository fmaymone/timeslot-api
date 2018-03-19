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

<pre>Authorization: Token token=eBtmOhKAArL-vgy2TfuGX8so4Xs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/31/comments</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/31/comments&quot; -X GET \
	-H &quot;Authorization: Token token=eBtmOhKAArL-vgy2TfuGX8so4Xs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;7d73149ad5650cb24dc782e2105764a4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a8beb72c-183b-45a4-8f52-51735cf21326
X-Runtime: 0.016018
Content-Length: 850</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
