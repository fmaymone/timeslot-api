# Slots API

## Update StdSlot - change visibility

### PATCH /v1/stdslot/:id

Update visibility of StdSlot.

User must be owner of StdSlot.

returns 200 and slot data if update succeded 

returns 404 if User not owner or ID is invalid

returns 422 if parameters are invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to update

Name : visibility
Description : Visibility of the Slot to update (private/friends/foaf/public)

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

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=ATn8ZHzCVF4O8kJP23_jeY-ONEY
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/2</pre>

#### Body
```javascript
{
  "visibility" : "friends"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/2&quot; -d &#39;{&quot;visibility&quot;:&quot;friends&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=ATn8ZHzCVF4O8kJP23_jeY-ONEY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a05ac5f2d364f76ea88b2ca3bd01ddbb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 25c4f545-3022-4c91-a818-dcd3fb3d16f5
X-Runtime: 0.044338
Vary: Origin
Content-Length: 508</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 2,
  "title" : "Slot title 61",
  "startDate" : "2019-09-12T17:44:02.000Z",
  "createdAt" : "2015-11-24T23:47:33.422Z",
  "updatedAt" : "2015-11-24T23:47:33.456Z",
  "deletedAt" : null,
  "endDate" : "2019-10-12T17:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 4,
    "username" : "User 286",
    "createdAt" : "2015-11-24T23:47:33.413Z",
    "updatedAt" : "2015-11-24T23:47:33.413Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "friends",
  "reslotsCounter" : 0,
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
