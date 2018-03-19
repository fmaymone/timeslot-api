# Slots API

## Update Slot - Add notes

### PATCH /v1/slots/:id

### Parameters

Name : id *- required -*
Description : ID of the slot to update

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

Name : notes *- required -*
Description : Scope for new notes

Name : title *- required -*
Description : Title of the note

Name : content *- required -*
Description : Content of the note

Name : localId
Description : Local ID of the note, temporary feature


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

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=6HBE8BbMEl2MYPfmJyRaeOFJ1ac
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/slots/12</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/12&quot; -d &#39;{&quot;notes&quot;:[{&quot;title&quot;:&quot;Title for Note 182&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;,&quot;localId&quot;:&quot;123321&quot;},{&quot;title&quot;:&quot;Title for Note 183&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=6HBE8BbMEl2MYPfmJyRaeOFJ1ac&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;08871300e913bb72db5ae42c822ec92c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 210e816a-00e6-43ab-91e5-385e43b0f7b1
X-Runtime: 0.187682
Content-Length: 919</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
