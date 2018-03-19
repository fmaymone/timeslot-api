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

<pre>Authorization: Token token=HScsmNZusWzpEOG5yxlU56XlLl0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/32/slotters</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/32/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=HScsmNZusWzpEOG5yxlU56XlLl0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;31aeafeb531ec5a193c3eb95f8ede0e1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7d2450e9-512f-40d7-a25a-0c843d1cd475
X-Runtime: 0.017400
Content-Length: 403</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
