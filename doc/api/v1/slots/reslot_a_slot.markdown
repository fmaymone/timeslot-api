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

Name : slotter
Description : contains ID of the User who did reslot

Name : parent
Description : contains ID of the original slot that was reslottet

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=xNfaCnybXSxZWJHFa1L4ZXz1uMI
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/reslot</pre>

#### Body
```javascript
{
  "predecessorId" : 44
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot&quot; -d &#39;{&quot;predecessorId&quot;:44}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=xNfaCnybXSxZWJHFa1L4ZXz1uMI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5c9780286b0bd13d791defc0738f8ce7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8ebff67f-566d-4b93-b085-3e7a19ac17ab
X-Runtime: 0.030886
Vary: Origin
Content-Length: 553</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 45,
  "title" : "Slot title 54",
  "startDate" : "2019-09-05T10:44:02.000Z",
  "createdAt" : "2015-11-17T23:46:14.648Z",
  "updatedAt" : "2015-11-17T23:46:14.648Z",
  "deletedAt" : null,
  "endDate" : "2019-10-05T10:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 226,
    "username" : "User 271",
    "createdAt" : "2015-11-17T23:46:14.622Z",
    "updatedAt" : "2015-11-17T23:46:14.622Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 228
  },
  "parent" : {
    "id" : 44
  },
  "visibility" : "public",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
