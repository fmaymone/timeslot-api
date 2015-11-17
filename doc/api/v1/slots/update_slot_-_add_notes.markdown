# Slots API

## Update Slot - Add notes

### PATCH /v1/stdslot/:id

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
Authorization: Token token=j9nwoa1yekwS7n4maiA3bYl9E3U
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/3</pre>

#### Body
```javascript
{
  "notes" : [
    {
      "title" : "Title for Note 2",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "localId" : "123321"
    },
    {
      "title" : "Title for Note 3",
      "content" : "Liebe ist ein Kind der Freiheit!"
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/3&quot; -d &#39;{&quot;notes&quot;:[{&quot;title&quot;:&quot;Title for Note 2&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;,&quot;localId&quot;:&quot;123321&quot;},{&quot;title&quot;:&quot;Title for Note 3&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=j9nwoa1yekwS7n4maiA3bYl9E3U&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3db8c724af4332bdd6d0d3e5f34db94a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7e92e4c0-83b8-4b6f-80ad-6a18694fc5b6
X-Runtime: 0.032928
Vary: Origin
Content-Length: 814</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 3,
  "title" : "Slot title 40",
  "startDate" : "2019-09-18T20:44:02.000Z",
  "createdAt" : "2015-11-17T12:12:39.880Z",
  "updatedAt" : "2015-11-17T12:12:39.880Z",
  "deletedAt" : null,
  "endDate" : "2019-10-18T20:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 7,
    "username" : "User 249",
    "createdAt" : "2015-11-17T12:12:39.876Z",
    "updatedAt" : "2015-11-17T12:12:39.876Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [
    {
      "id" : 2,
      "title" : "Title for Note 3",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "localId" : null,
      "createdAt" : "2015-11-17T12:12:39.896Z"
    },
    {
      "id" : 1,
      "title" : "Title for Note 2",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "localId" : "123321",
      "createdAt" : "2015-11-17T12:12:39.893Z"
    }
  ],
  "media" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "visibility" : "private",
  "reslotsCounter" : 0,
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
