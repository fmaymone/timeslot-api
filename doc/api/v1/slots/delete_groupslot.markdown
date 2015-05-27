# Slots API

## Delete GroupSlot

### DELETE /v1/groupslot/:id

Sets &#39;deletedAt&#39;, returns updated Group Slot data. Doesn&#39;t delete anything.

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Group Slot to delete


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

Name : groupId
Description : ID of the group the slot belongs to

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

Name : groupId
Description : ID of the group the slot belongs to

### Request

#### Headers

<pre>Authorization: Token token=5Js-j5ddTq-DJK1zy3-zkRnJuIY
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groupslot/40</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groupslot/40&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=5Js-j5ddTq-DJK1zy3-zkRnJuIY&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;27e32bd9b6d0fbc3462978314054311a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c4501916-19d9-42e1-9768-4a9d8bb5830c
X-Runtime: 0.048432
Content-Length: 642</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 40,
  "title" : "Slot title 36",
  "createdAt" : "2015-05-27T12:18:01.514Z",
  "updatedAt" : "2015-05-27T12:18:01.537Z",
  "deletedAt" : "2015-05-27T12:18:01.535Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-10T12:44:02.000Z",
  "visibility" : null,
  "location" : {
    "id" : 38,
    "name" : "berlin",
    "street" : "",
    "city" : "",
    "postcode" : "",
    "country" : "",
    "latitude" : null,
    "longitude" : null
  },
  "creator" : {
    "id" : 213,
    "username" : "User 210",
    "createdAt" : "2015-05-27T12:18:01.503Z",
    "updatedAt" : "2015-05-27T12:18:01.503Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "groupId" : 41,
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}
```
