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

<pre>Authorization: Token token=uEX1pcWUSDFWXS3TNymeWMOiSLs
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/reslot/43</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/reslot/43&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=uEX1pcWUSDFWXS3TNymeWMOiSLs&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a29687a03f63e0669c5c40ae390dbc20&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 203005ad-cd5e-4630-9595-d5e7d155847e
X-Runtime: 0.042102
Content-Length: 645</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 43,
  "title" : "Slot title 39",
  "createdAt" : "2015-05-27T12:18:01.626Z",
  "updatedAt" : "2015-05-27T12:18:01.727Z",
  "deletedAt" : "2015-05-27T12:18:01.723Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-13T15:44:02.000Z",
  "visibility" : null,
  "location" : {
    "id" : 41,
    "name" : "berlin",
    "street" : "",
    "city" : "",
    "postcode" : "",
    "country" : "",
    "latitude" : null,
    "longitude" : null
  },
  "creator" : {
    "id" : 222,
    "username" : "User 219",
    "createdAt" : "2015-05-27T12:18:01.630Z",
    "updatedAt" : "2015-05-27T12:18:01.630Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "slotterId" : 218,
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}
```
