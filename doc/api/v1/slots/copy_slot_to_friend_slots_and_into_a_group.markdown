# Slots API

## Copy Slot to Friend Slots and into a group

### POST /v1/slots/:id/copy

Several new slot instances can be created which share the same Metadata as the copy source. If details is set to &#39;true&#39; all media items and notes will be duplicated.

### Parameters

Name : copyTo *- required -*
Description : contains an array of the copy targets

Name : slotType
Description : Type of slot to copy to. Must be own of [private/friends/public]

Name : groupId
Description : ID of the group to copy to, user must be allowed to post to this group

Name : details
Description : Duplicate all media data and notes on the copied slots. Defaults to &#39;true&#39;.

Must be one of [true/false]

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=ruT4--k0wl6Ay2fX1VJwZ-xZOdM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/31/copy</pre>

#### Body
```javascript
{
  "copyTo" : [
    {
      "slotType" : "friends",
      "details" : "true"
    },
    {
      "groupId" : 5
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/31/copy&quot; -d &#39;{&quot;copyTo&quot;:[{&quot;slotType&quot;:&quot;friends&quot;,&quot;details&quot;:&quot;true&quot;},{&quot;groupId&quot;:5}]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=ruT4--k0wl6Ay2fX1VJwZ-xZOdM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 7520075f-c801-4735-8fef-2f19125948e2
X-Runtime: 0.037087
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

