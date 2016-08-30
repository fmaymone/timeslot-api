# Slots API

## Update StdSlot - change title

### PATCH /v1/slots/:id

Update content of StdSlot.

User must be creator of StdSlot.

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

Name : description
Description : Description for the slot (max. 500 characters)

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

Name : description
Description : Description for the slot

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

Name : likerIds
Description : Array with IDs of Users who like the slot

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
Authorization: Token token=RcW2IaUw3FU-ugDtho8enSwLhTU
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/slots/12</pre>

#### Body
```javascript
{
  "title" : "New title for a Slot"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/12&quot; -d &#39;{&quot;title&quot;:&quot;New title for a Slot&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=RcW2IaUw3FU-ugDtho8enSwLhTU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;6cd82eda0c365e3936f3589c02640606&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4b10e771-1f03-4729-b0e5-132f63576122
X-Runtime: 0.067026
Content-Length: 621</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 12,
  "title" : "New title for a Slot",
  "description" : "",
  "startDate" : "2019-09-07T00:44:02.000Z",
  "createdAt" : "2016-08-30T09:51:07.623Z",
  "updatedAt" : "2016-08-30T09:51:07.623Z",
  "deletedAt" : null,
  "endDate" : "2019-10-07T00:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 23,
    "username" : "User 729",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:07.615Z",
    "updatedAt" : "2016-08-30T09:51:07.615Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "private",
  "likerIds" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "firstGroup" : null,
  "slotGroupUuids" : [],
  "visibleCount" : "1"
}
```
