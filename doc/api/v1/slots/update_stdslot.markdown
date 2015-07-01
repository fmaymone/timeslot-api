# Slots API

## Update StdSlot

### PATCH /v1/stdslot/:id

Update content of StdSlot.

User must be owner of StdSlot.

returns 200 and slot data if update succeded 

returns 404 if User not owner or ID is invalid

returns 422 if parameters are invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to update

Name : title *- required -*
Description : Title of slot (max. 60 characters)

Name : startDate *- required -*
Description : Startdate and Time of the Slot

Name : endDate *- required -*
Description : Enddate and Time of the Slot (startdate + duration).

Name : location
Description : Location associated with this slot (see example)

Name : media
Description : Media items (image/audio/video) of to the Slot (see example)

Name : notes
Description : Notes for to the Slot (see example)

Name : settings
Description : User specific settings for the slot (alerts)

Name : alerts
Description : Alerts for the Slot


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

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=FQv2wvkfnrYi6btkdsq4pjr858s
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/35</pre>

#### Body
```javascript
{
  "title" : "New title for a Slot"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/35&quot; -d &#39;{&quot;title&quot;:&quot;New title for a Slot&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=FQv2wvkfnrYi6btkdsq4pjr858s&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;acb5dc4ebf6fd8c4bfce5ce512d6c282&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 22d28d39-b535-4ce5-8bbc-370ec856d4fc
X-Runtime: 0.038764
Content-Length: 548</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 35,
  "title" : "New title for a Slot",
  "startDate" : "2019-09-04T06:44:02.000Z",
  "endDate" : "2019-10-04T06:44:02.000Z",
  "createdAt" : "2015-06-27T07:27:15.664Z",
  "updatedAt" : "2015-06-27T07:27:15.664Z",
  "deletedAt" : null,
  "openEnd" : false,
  "location" : null,
  "creator" : {
    "id" : 167,
    "username" : "User 164",
    "createdAt" : "2015-06-27T07:27:15.659Z",
    "updatedAt" : "2015-06-27T07:27:15.659Z",
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
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
