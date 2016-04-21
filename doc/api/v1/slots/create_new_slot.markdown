# Slots API

## Create new slot

### POST /v1/slots

Creates a new slot for the user.

If the &#39;MyCalendar&#39;-UUID is given the new slot will be added to the users schedule. Also it will be added to all given slotGroups where the user has write permission.

Default slot visibility is *private*. If the &#39;shareWithFriends&#39;-UUID is submitted, the slot will be *friend-visible*.

If at least **one public calendar** is submitted where the slot should be included, then the slot will be *public*.

For backward compatibility the &#39;visibility&#39; can still be submitted. If **visibility** is set to *private* or *friends*, but no private calendar is submitted, the slot is put in the users &#39;MyPrivateSlots&#39; calendar. Also if visibility is set to *friends*, the **show_to_friend** flag will be set. If *public* is submitted, but no accompanying public calendar, the slot will be put into the users &#39;MyPublicSlots&#39; calendar.

If the submitted visiblity contradicts the visibility resulting from the submitted calendars, the highest visibility will win.

Returns data of new slot and array with unauthorized slotGroup UUIDs (User has no write access or slotgroup deleted).

Returns 422 if parameters are invalid or missing.

### Parameters

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

Name : visibility
Description : Deprecated: Visibility of the Slot (private/friends/foaf/public)

Name : slotGroups
Description : Array with UUIDs of the SlotGroups slot should be added to


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

Name : reslotsCounter
Description : Number of reslots for this slot

Name : unauthorizedSlotgroups
Description : Array of Slotgroup UUIDs where the current_user has no write access or Slotgroup was deleted. Will be empty if all worked fine.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=cWFiGDEoHSkuzz9PcEay8IMdzzU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "endDate" : "2014-09-13T22:03:24.000Z",
  "notes" : [
    {
      "title" : "revolutionizing the calendar",
      "content" : "this is content"
    },
    {
      "title" : "and another title",
      "content" : "more content here"
    }
  ],
  "settings" : {
    "alerts" : "0101010101"
  },
  "visibility" : "private",
  "slotGroups" : [
    "4ae71e34-e91c-42b7-bac7-8e815cc33d8c",
    "5af3e5af-ed19-411f-b80c-dbf43871243e",
    "89f6fefb-3780-4adc-b3b3-606fe4b00694",
    "0654d725-35a3-4348-a3e8-8d277cff4bde",
    "5a819be4-bae5-427b-9adf-7da92019498d"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;visibility&quot;:&quot;private&quot;,&quot;slotGroups&quot;:[&quot;4ae71e34-e91c-42b7-bac7-8e815cc33d8c&quot;,&quot;5af3e5af-ed19-411f-b80c-dbf43871243e&quot;,&quot;89f6fefb-3780-4adc-b3b3-606fe4b00694&quot;,&quot;0654d725-35a3-4348-a3e8-8d277cff4bde&quot;,&quot;5a819be4-bae5-427b-9adf-7da92019498d&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=cWFiGDEoHSkuzz9PcEay8IMdzzU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ed95bd798d45308ac4f0b7c54d4b3f8c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 53826c24-3c07-47fa-91d5-c02468082f0d
X-Runtime: 0.250935
Vary: Origin
Content-Length: 910</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 17,
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "createdAt" : "2016-04-19T23:13:26.227Z",
  "updatedAt" : "2016-04-19T23:13:26.227Z",
  "deletedAt" : null,
  "endDate" : "2014-09-13T22:03:24.000Z",
  "location" : null,
  "creator" : {
    "id" : 48,
    "username" : "User 46",
    "createdAt" : "2016-04-19T23:13:26.131Z",
    "updatedAt" : "2016-04-19T23:13:26.131Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 1,
    "calendarCount" : 3,
    "friendsCount" : 0
  },
  "notes" : [
    {
      "id" : 3,
      "title" : "and another title",
      "content" : "more content here",
      "localId" : null,
      "createdAt" : "2016-04-19T23:13:26.245Z"
    },
    {
      "id" : 2,
      "title" : "revolutionizing the calendar",
      "content" : "this is content",
      "localId" : null,
      "createdAt" : "2016-04-19T23:13:26.242Z"
    }
  ],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "private",
  "likerIds" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "unauthorizedSlotgroups" : [
    "0654d725-35a3-4348-a3e8-8d277cff4bde",
    "5a819be4-bae5-427b-9adf-7da92019498d"
  ]
}
```
