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
Authorization: Token token=453CUDnaGcl46L2q4a61IkNlcIU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/28/comment</pre>

#### Body
```javascript
{
  "content" : "Liebe ist ein Kind der Freiheit"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/28/comment&quot; -d &#39;{&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=453CUDnaGcl46L2q4a61IkNlcIU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: f795bcd4-2483-4a6c-8390-662124f65925
X-Runtime: 0.039807
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

