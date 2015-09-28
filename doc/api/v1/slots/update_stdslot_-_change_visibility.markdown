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
Description : Visibility of the Slot to update (private/friends/public)

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

Name : reslotsCounter
Description : Number of reslots for this slot

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
Authorization: Token token=-PzRwEkdZuMC8aYZOxQp3zwRV7g
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/42</pre>

#### Body
```javascript
{
  "visibility" : "friends"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/42&quot; -d &#39;{&quot;visibility&quot;:&quot;friends&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=-PzRwEkdZuMC8aYZOxQp3zwRV7g&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c0cb0279537f0419a8b5a6b5a1575118&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fa499141-4891-4e07-89ac-3c4c1e4586f5
X-Runtime: 0.037758
Vary: Origin
Content-Length: 525</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 42,
  "title" : "Slot title 33",
  "startDate" : "2019-09-07T09:44:02.000Z",
  "createdAt" : "2015-09-28T10:15:48.732Z",
  "updatedAt" : "2015-09-28T10:15:48.745Z",
  "deletedAt" : null,
  "endDate" : "2019-10-07T09:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 240,
    "username" : "User 204",
    "createdAt" : "2015-09-28T10:15:48.727Z",
    "updatedAt" : "2015-09-28T10:15:48.727Z",
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
  "visibility" : "friends",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
