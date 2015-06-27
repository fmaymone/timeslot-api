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

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos recordings for the slot

Name : slotterId
Description : ID of the User who did reslot

### Request

#### Headers

<pre>Authorization: Token token=09ahQDC4j4aVWwB3X9EONF3twg0
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/reslot/45</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot/45&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=09ahQDC4j4aVWwB3X9EONF3twg0&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;88f5970aa9b4f906bb153296d6c88fc6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 98d8d033-bfa7-4b28-be8a-bab4acb0a607
X-Runtime: 0.054734
Content-Length: 561</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 45,
  "title" : "Slot title 40",
  "startDate" : "2019-09-14T16:44:02.000Z",
  "endDate" : "2019-10-14T16:44:02.000Z",
  "createdAt" : "2015-06-27T07:27:20.257Z",
  "updatedAt" : "2015-06-27T07:27:20.299Z",
  "deletedAt" : "2015-06-27T07:27:20.296Z",
  "openEnd" : false,
  "location" : null,
  "creator" : {
    "id" : 187,
    "username" : "User 184",
    "createdAt" : "2015-06-27T07:27:20.260Z",
    "updatedAt" : "2015-06-27T07:27:20.260Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "slotter" : {
    "id" : 184
  },
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
