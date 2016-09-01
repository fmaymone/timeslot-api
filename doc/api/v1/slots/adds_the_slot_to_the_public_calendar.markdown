# Slots API

## adds the slot to the public calendar

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
Authorization: Token token=nSekHwoK0qU2KWuXs4QnssOKZiE
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/26/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "7b88abd2-224f-43b1-bfbf-e228de06750b",
    "5b8261b4-fb1d-46a1-92e1-adec615809b4"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/26/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;7b88abd2-224f-43b1-bfbf-e228de06750b&quot;,&quot;5b8261b4-fb1d-46a1-92e1-adec615809b4&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=nSekHwoK0qU2KWuXs4QnssOKZiE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;d22f446506f59f4196cd3309c5120ff5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8f43b323-e6a2-4c0e-9363-0b521afaef54
X-Runtime: 0.127138
Content-Length: 29</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "unauthorizedSlotgroups" : []
}
```
