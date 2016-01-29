# Slots API

## Add public ReSlot to multiple SlotGroups

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
Authorization: Token token=XNFu9aw4UKfm4itnDsJYaWna278
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/16/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "606ab722-bef4-4fb7-88bb-e99943fa7dbe",
    "c9237ce4-84cf-4ae1-91dc-9ffc63e20ddd",
    "047c2acd-12b9-42bd-a3ba-01c9e54a3305",
    "8753d728-0cd7-4328-9ee0-ba1227629c92"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/16/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;606ab722-bef4-4fb7-88bb-e99943fa7dbe&quot;,&quot;c9237ce4-84cf-4ae1-91dc-9ffc63e20ddd&quot;,&quot;047c2acd-12b9-42bd-a3ba-01c9e54a3305&quot;,&quot;8753d728-0cd7-4328-9ee0-ba1227629c92&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=XNFu9aw4UKfm4itnDsJYaWna278&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d720dcfe8a3de77cda483b940f06a392&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1c9b3297-b2fc-4ec8-a841-5ea3f17f35e6
X-Runtime: 0.118398
Vary: Origin
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "unauthorizedSlotgroups" : [
    "047c2acd-12b9-42bd-a3ba-01c9e54a3305",
    "8753d728-0cd7-4328-9ee0-ba1227629c92"
  ]
}
```
