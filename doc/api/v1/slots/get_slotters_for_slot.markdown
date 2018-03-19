# Slots API

## Get Slotters for Slot

### GET /v1/slots/:id/slotters

returns a list of all users who have the slot in their calendar. For now there is no distinction between visibilities as backend has no support for this yet.

returns 401 if User not allowed to see Slotter data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the slotters for


### Response Fields

Name : array
Description : list of all users who added the slot to their &#39;MyCalendar&#39;

### Request

#### Headers

<pre>Authorization: Token token=v3dB2YCF3M5UiKkk3QX4HmLPD_g
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/33/slotters</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/slots/33/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=v3dB2YCF3M5UiKkk3QX4HmLPD_g&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;4e780eef6822864f72fd58295a3fefb6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f437b46c-15bb-4527-971a-5f329b8cd7de
X-Runtime: 0.022539
Content-Length: 403</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
