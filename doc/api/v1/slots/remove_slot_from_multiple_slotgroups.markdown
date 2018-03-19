# Slots API

## Remove Slot from multiple SlotGroups

### DELETE /v1/slots/:id/slotgroups

Send an array of slotGroup UUIDs and the slot will be removed from those slotGroups.

returns 404 if ID is invalid

returns ???

### Parameters

Name : id *- required -*
Description : ID of the Slot to be removed from SlotGroups

Name : slotGroups *- required -*
Description : Array with UUIDs of the SlotGroups slot should be removed from


### Response Fields

Name : unauthorizedSlotgroups
Description : Array of Slotgroup UUIDs where the current_user has no write access or Slotgroup was deleted. Will be empty if all worked fine.

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=4_mtKZFnAcc95YDATEM6W1cSfJY
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/26/slotgroups</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/26/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;c5e4d724-da76-4f00-bfba-6d3c454bd5c7&quot;,&quot;8aa7ce9b-e03c-46b4-9777-5177c6f2d50a&quot;,&quot;f1789ca3-565e-42c1-a042-db1b95d9fa0b&quot;,&quot;3d01f88a-a04f-4012-bbf9-34cd8bd2929b&quot;,&quot;8cf138ae-db07-44ba-b115-bab127ee19b0&quot;]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=4_mtKZFnAcc95YDATEM6W1cSfJY&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;72d6902719b29136c373b1764bb8265e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 85ae02b8-4f54-4517-9248-b780a1822024
X-Runtime: 0.213358
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
