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
Authorization: Token token=wjr-8B66N065yOPzjBc3_TT84mY
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/57/copy</pre>

#### Body
```javascript
{
  "copyTo" : [
    {
      "slotType" : "friends",
      "details" : "true"
    },
    {
      "groupId" : 45
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/57/copy&quot; -d &#39;{&quot;copyTo&quot;:[{&quot;slotType&quot;:&quot;friends&quot;,&quot;details&quot;:&quot;true&quot;},{&quot;groupId&quot;:45}]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=wjr-8B66N065yOPzjBc3_TT84mY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 2f0540a0-8d86-47e5-bb66-7cd8ea6b5ec2
X-Runtime: 0.036359
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

