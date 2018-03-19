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
Authorization: Token token=2h1wQNbov2_zbvmBWs52e69saQM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/23/slotgroups</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/23/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;ecd2b00f-d817-4481-baf9-b1d21462e74b&quot;,&quot;338af0e0-11ad-4062-a37a-7275eb5ab4e0&quot;,&quot;170a1ad5-78e2-42e5-8753-235f7f720d84&quot;,&quot;f7d201c2-32c1-4fda-bb62-075354a19791&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=2h1wQNbov2_zbvmBWs52e69saQM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;2c3c3e83fff6456fe72c95240b108849&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 70c31845-f31b-467d-b26a-b30b4cb355af
X-Runtime: 0.235746
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
