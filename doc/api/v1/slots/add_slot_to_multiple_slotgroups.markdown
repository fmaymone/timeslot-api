# Slots API

## Add Slot to multiple SlotGroups

### POST /v1/slots/:id/slotgroups

Send an array of slotGroup UUIDs and the slot will be added to those slotGroups.

returns 404 if ID is invalid

returns ???

### Parameters

Name : id *- required -*
Description : ID of the Slot to be added to SlotGroups

Name : slotGroups *- required -*
Description : Array with UUIDs of the SlotGroups the slot should be added to


### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : openEnd
Description : OpenEnd Boolean Flag

Name : createdAt
Description : Creation of slot

Name : updatedAt
Description : Last update of slot

Name : deletedAt
Description : Delete date of slot or nil

Name : location
Description : Location data for the slot

Name : creator
Description : User who created the slot

Name : settings
Description : Only included if it&#39;s a slot of the current User (created-/friend-/re-/groupslot),

contains User specific settings for this slot (alerts)

Name : visibility
Description : Visibiltiy of the slot (private/friend/foaf/public)

Name : notes
Description : Notes on the slot

Name : likes
Description : Likes for the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : shareUrl
Description : Share URL for this slot, nil if not yet shared

Name : images
Description : Images for the slot

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos recordings for the slot

Name : reslotsCounter
Description : Number of reslots for this slot

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=GYjQ9zShJA_CeJZ8u3t5If80QUo
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/14/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "1a3e1691-eafc-47cd-a725-d2751938b100",
    "3c40cf89-771f-4d5e-9c5c-30b06a0f93af"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/14/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;1a3e1691-eafc-47cd-a725-d2751938b100&quot;,&quot;3c40cf89-771f-4d5e-9c5c-30b06a0f93af&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=GYjQ9zShJA_CeJZ8u3t5If80QUo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: e34c4eb7-580b-4761-99e1-94f0b97a6c82
X-Runtime: 0.009704
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

