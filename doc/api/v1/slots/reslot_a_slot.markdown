# Slots API

## Reslot a slot

### POST /v1/reslot

Returns data of new ReSlot.

returns 404 if Predecessor Slot doesn&#39;t exist

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : predecessorId *- required -*
Description : ID of the Slot which was resloted


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

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=v5-RZeYmo1ibse-yJJYv4HdXJGo
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/reslot</pre>

#### Body
```javascript
{
  "predecessorId" : 30
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/reslot&quot; -d &#39;{&quot;predecessorId&quot;:30}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=v5-RZeYmo1ibse-yJJYv4HdXJGo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;cb94d244d4b814c4e7f1c7a90fce3063&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dfdf33e1-273b-41cf-9c9b-8f2b3221900a
X-Runtime: 0.030356
Content-Length: 520</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 31,
  "title" : "Slot title 28",
  "createdAt" : "2015-05-22T15:50:01.858Z",
  "updatedAt" : "2015-05-22T15:50:01.858Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-02T04:44:02.000Z",
  "visibility" : null,
  "location" : null,
  "creator" : {
    "id" : 159,
    "username" : "User 156",
    "createdAt" : "2015-05-22T15:50:01.830Z",
    "updatedAt" : "2015-05-22T15:50:01.830Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "slotterId" : 161,
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}
```
