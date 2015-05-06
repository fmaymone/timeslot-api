# Slots API

## Make Comment on Slot

### POST /v1/slots/:id/comment

Current user makes a comment on a slot.

### Parameters

Name : id *- required -*
Description : ID of the Slot to make a comment on

Name : content *- required -*
Description : Content of the comment

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=OK4TUrJ-_Rho-fTuY65aJ0EQ8js
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/47/comment</pre>

#### Body

<pre>{"content":"Liebe ist ein Kind der Freiheit"}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/47/comment&quot; -d &#39;{&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=OK4TUrJ-_Rho-fTuY65aJ0EQ8js&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
ETag: &quot;7215ee9c7d9dc229d2921a40e899ec5f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9c40da6c-293d-4845-98d6-5a90f03dba0f
X-Runtime: 0.010192
Content-Length: 1</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre></pre>
