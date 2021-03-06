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

Name : rrule
Description : Repeating Rule for the Slot.

Name : allday
Description : The All-Day boolean Flag indicates that a Slot lasts for one or more complete days (default: false).

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

Name : rrule
Description : Repeating Rule for the slot

Name : allday
Description : All-Day Boolean Flag

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

Name : reslotsCounter
Description : Number of reslots for this slot

Name : unauthorizedSlotgroups
Description : Array of Slotgroup UUIDs where the current_user has no write access or Slotgroup was deleted. Will be empty if all worked fine.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=T-peq3NRmhOvFzGDb_3wwh7xxGk
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/slots&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;rrule&quot;:&quot;RRULE:FREQ=WEEKLY;BYDAY=TH&quot;,&quot;description&quot;:&quot;One day it will all make sense.&quot;,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;visibility&quot;:&quot;private&quot;,&quot;slotGroups&quot;:[&quot;9ee6222c-67e0-49b0-8979-080f897f1a2d&quot;,&quot;c0befb18-8abc-4450-9c69-99ebccb2bfdf&quot;,&quot;15cce6e6-9482-46d4-9eb9-af4e09b6ee25&quot;,&quot;f4f66cb1-40bf-4cef-a73d-b613308c734e&quot;,&quot;ba1dbf3f-23ee-47c4-ab37-d9e26cd9d40f&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=T-peq3NRmhOvFzGDb_3wwh7xxGk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;849d2171084041982d1e90fe6c46540d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: be463b9e-da36-49a3-84aa-4e2d1e0d015f
X-Runtime: 0.592646
Content-Length: 1693</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript

```
