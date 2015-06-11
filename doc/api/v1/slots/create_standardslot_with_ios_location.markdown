# Slots API

## Create StandardSlot with IOS Location

### POST /v1/stdslot

Returns data of new slot.

Missing unrequiered fields will be filled with default values.

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : title *- required -*
Description : Title of slot (max. 60 characters)

Name : startDate *- required -*
Description : Startdate and Time of the Slot

Name : endDate *- required -*
Description : Enddate and Time of the Slot (startdate + duration)

Name : locationId
Description : ID of the location associated with this slot

Name : notes
Description : Notes for to the Slot

Name : settings
Description : User specific settings for the slot (alerts)

Name : alerts
Description : Alerts for the Slot

Name : iosLocation
Description : IOS location associated with this slot

Name : name
Description : Name of the IOS location (128 chars)

Name : street
Description : Street of IOS location (128 chars)

Name : city
Description : City of IOS location (128 chars)

Name : postcode
Description : Postcode of IOS location (32 chars)

Name : country
Description : Country of IOS location (64 chars)

Name : latitude
Description : Latitude of IOS location

Name : longitude
Description : Longitude of IOS location

Name : auid
Description : Apple UID of the location

Name : private_location
Description : private location for this user (true/false) [not yet sure what it will mean technically] -&gt; default: false

Name : visibility *- required -*
Description : Visibility of the Slot


### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

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

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos recordings for the slot

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=f2zAiBdfdvN_3LLQPtKTgOPzG-I
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/stdslot</pre>

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
  "iosLocation" : {
    "name" : "Soho House",
    "street" : "Torstrasse 1",
    "city" : "Berlin",
    "postcode" : "10119",
    "country" : "Germany",
    "latitude" : "52.527335",
    "longitude" : "13.414259",
    "auid" : 9032563782833995324,
    "private_location" : false
  },
  "visibility" : "private"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;iosLocation&quot;:{&quot;name&quot;:&quot;Soho House&quot;,&quot;street&quot;:&quot;Torstrasse 1&quot;,&quot;city&quot;:&quot;Berlin&quot;,&quot;postcode&quot;:&quot;10119&quot;,&quot;country&quot;:&quot;Germany&quot;,&quot;latitude&quot;:&quot;52.527335&quot;,&quot;longitude&quot;:&quot;13.414259&quot;,&quot;auid&quot;:9032563782833995324,&quot;private_location&quot;:false},&quot;visibility&quot;:&quot;private&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=f2zAiBdfdvN_3LLQPtKTgOPzG-I&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;136b5b2ded856ea77b476fe6009d166e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1c0df385-326a-4c69-a503-8871e31fed11
X-Runtime: 0.050355
Content-Length: 915</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 29,
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "createdAt" : "2015-06-11T16:20:53.653Z",
  "updatedAt" : "2015-06-11T16:20:53.653Z",
  "deletedAt" : null,
  "endDate" : "2014-09-13T22:03:24.000Z",
  "location" : {
    "id" : 2,
    "name" : "Soho House",
    "street" : "Torstrasse 1",
    "city" : "Berlin",
    "postcode" : "10119",
    "country" : "Germany",
    "latitude" : 52.527335,
    "longitude" : 13.414259
  },
  "creator" : {
    "id" : 156,
    "username" : "User 153",
    "createdAt" : "2015-06-11T16:20:53.632Z",
    "updatedAt" : "2015-06-11T16:20:53.632Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  },
  "notes" : [
    {
      "id" : 8,
      "title" : "revolutionizing the calendar",
      "content" : "this is content",
      "createdAt" : "2015-06-11T16:20:53.656Z"
    },
    {
      "id" : 9,
      "title" : "and another title",
      "content" : "more content here",
      "createdAt" : "2015-06-11T16:20:53.658Z"
    }
  ],
  "photos" : [],
  "voices" : [],
  "videos" : [],
  "settings" : {
    "alerts" : "0101010101"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
