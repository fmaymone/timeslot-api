# Slots API

## Add own private ReSlot to multiple SlotGroups

### POST /v1/slots/:id/slotgroups

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
Authorization: Token token=1UxJHyljBE0ijKJvxOPldN68Vr0
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/18/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "379cff1e-6078-443b-bc9a-eaa2bb44bdf8",
    "8afaf4bb-dde8-46c1-87a7-948e6262e532",
    "116b63c8-c513-4fa8-8c94-ad02494498f0",
    "4de6adef-8e45-41aa-ae2e-8d526c2e3038"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/18/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;379cff1e-6078-443b-bc9a-eaa2bb44bdf8&quot;,&quot;8afaf4bb-dde8-46c1-87a7-948e6262e532&quot;,&quot;116b63c8-c513-4fa8-8c94-ad02494498f0&quot;,&quot;4de6adef-8e45-41aa-ae2e-8d526c2e3038&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=1UxJHyljBE0ijKJvxOPldN68Vr0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;58897275a0f2e0c16c3b171b54efdbc4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0045ad86-f948-4898-ab27-54b05ca35b6d
X-Runtime: 0.084933
Vary: Origin
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "unauthorizedSlotgroups" : [
    "116b63c8-c513-4fa8-8c94-ad02494498f0",
    "4de6adef-8e45-41aa-ae2e-8d526c2e3038"
  ]
}
```
