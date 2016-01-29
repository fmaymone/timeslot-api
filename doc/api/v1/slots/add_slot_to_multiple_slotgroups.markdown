# Slots API

## Add Slot to multiple SlotGroups

### POST /v1/slots/:id/slotgroups

Send an array of slotGroup UUIDs and the slot will be added to those slotGroups.

returns a list of all slotgroups where user has no access rights

returns 404 if ID is invalid

returns ???

### Parameters

Name : id *- required -*
Description : ID of the Slot to be added to SlotGroups

Name : slotGroups *- required -*
Description : Array with UUIDs of the SlotGroups the slot should be added to


### Response Fields

Name : unauthorizedSlotgroups
Description : Array of Slotgroup UUIDs where the current_user has no write access or Slotgroup was deleted. Will be empty if all worked fine.

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=NLfSc_euvCbeAOyIOq4lDq4KKnw
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/14/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "366d31f4-9581-4f8f-bb88-d6ffc9b54ca2",
    "e4f7ecaf-ca72-40a9-b90f-ab7e376c843a",
    "b273a55d-5eba-4ff4-aab8-f41d6761f150",
    "23652ed5-25c1-4369-8ecd-73b761192f1b"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/14/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;366d31f4-9581-4f8f-bb88-d6ffc9b54ca2&quot;,&quot;e4f7ecaf-ca72-40a9-b90f-ab7e376c843a&quot;,&quot;b273a55d-5eba-4ff4-aab8-f41d6761f150&quot;,&quot;23652ed5-25c1-4369-8ecd-73b761192f1b&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=NLfSc_euvCbeAOyIOq4lDq4KKnw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9b8a51be22e3f0c7b49e629135ae401f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9e56c87e-9924-46ad-a9f5-62f0c7da4b94
X-Runtime: 0.082049
Vary: Origin
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "unauthorizedSlotgroups" : [
    "b273a55d-5eba-4ff4-aab8-f41d6761f150",
    "23652ed5-25c1-4369-8ecd-73b761192f1b"
  ]
}
```
