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
Authorization: Token token=FPXN1SgXEclp_fKBVgLtnx29GGg
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/23/slotgroups</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/23/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;03e9edf1-493c-4e18-af60-866b673e28fc&quot;,&quot;103fb803-710e-419b-862b-dffd7860348e&quot;,&quot;5f294a9b-d12f-4230-9147-dfce784c0cf0&quot;,&quot;7e6789fd-0e95-47f7-a72f-6109acddd54e&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=FPXN1SgXEclp_fKBVgLtnx29GGg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;9c97d422c16c04154ffd7e0f5f8b0564&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4952ebb2-9740-4399-8342-620e3d498860
X-Runtime: 0.290597
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
