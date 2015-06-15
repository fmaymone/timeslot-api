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
Authorization: Token token=E80rCpusl3-A1tSUGKw9z5vWyt8
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/reslot</pre>

#### Body
```javascript
{
  "predecessorId" : 33
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot&quot; -d &#39;{&quot;predecessorId&quot;:33}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=E80rCpusl3-A1tSUGKw9z5vWyt8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4865ea1393b2e5f1a2acda9e82136e94&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c723aeb4-4255-4880-9798-a1fb825d8a1f
X-Runtime: 0.034560
Content-Length: 556</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 34,
  "title" : "Slot title 28",
  "startDate" : "2019-09-02T04:44:02.000Z",
  "createdAt" : "2015-06-15T11:19:14.382Z",
  "updatedAt" : "2015-06-15T11:19:14.382Z",
  "deletedAt" : null,
  "endDate" : "2019-10-02T04:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 162,
    "username" : "User 159",
    "createdAt" : "2015-06-15T11:19:14.361Z",
    "updatedAt" : "2015-06-15T11:19:14.361Z",
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
  "media" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "slotter" : {
    "id" : 164
  },
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
