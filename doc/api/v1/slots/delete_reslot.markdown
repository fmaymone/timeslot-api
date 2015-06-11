# Slots API

## Delete ReSlot

### DELETE /v1/reslot/:id

Sets &#39;deletedAt&#39;, returns updated reslot data. Doesn&#39;t delete anything.

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the ReSlot to delete


### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

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
Description : Visibiltiy of the slot

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

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos recordings for the slot

Name : slotterId
Description : ID of the User who did reslot

### Request

#### Headers

<pre>Authorization: Token token=V7-PMfD_t5zJTYhtRy_U77Rua5g
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/reslot/44</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot/44&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=V7-PMfD_t5zJTYhtRy_U77Rua5g&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;31af3a5e958da888a8aab15e15141057&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 57c6d7b2-0806-4119-a394-c1a52c91b9ee
X-Runtime: 0.057724
Content-Length: 567</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 44,
  "title" : "Slot title 39",
  "startDate" : "2019-09-13T15:44:02.000Z",
  "createdAt" : "2015-06-11T16:20:55.647Z",
  "updatedAt" : "2015-06-11T16:20:55.687Z",
  "deletedAt" : "2015-06-11T16:20:55.683Z",
  "endDate" : "2019-10-13T15:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 185,
    "username" : "User 182",
    "createdAt" : "2015-06-11T16:20:55.650Z",
    "updatedAt" : "2015-06-11T16:20:55.650Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "photos" : [],
  "voices" : [],
  "videos" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "slotter" : {
    "id" : 182
  },
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
