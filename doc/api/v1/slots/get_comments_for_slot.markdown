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

<pre>Authorization: Token token=niABI11UMpNnzSgSpkG19FJFc4w
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/32/comments</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/slots/32/comments&quot; -X GET \
	-H &quot;Authorization: Token token=niABI11UMpNnzSgSpkG19FJFc4w&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1c43f6ee69b555b1b893fc63c3846a72&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2fc28794-d0f7-4cd2-b45e-c671b0f1afe1
X-Runtime: 0.017781
Content-Length: 850</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
