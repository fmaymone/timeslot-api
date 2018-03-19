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

<pre>Authorization: Token token=eXrmBzKZ5ODD-5vLqVm0DPd0kEM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/29/likes</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/slots/29/likes&quot; -X GET \
	-H &quot;Authorization: Token token=eXrmBzKZ5ODD-5vLqVm0DPd0kEM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;9a58977eb1edeaa015fd8d2459067c82&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 64e091da-9d99-4451-918f-411b49abb775
X-Runtime: 0.031474
Content-Length: 953</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
