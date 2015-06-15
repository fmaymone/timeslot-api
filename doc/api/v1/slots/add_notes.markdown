# Slots API

## Add notes

### PATCH /v1/stdslot/:id

### Parameters

Name : id *- required -*
Description : ID of the slot to update

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

Name : location
Description : IOS location associated with this slot

Name : name
Description : Name of the IOS location, e.g. Timeslot Inc. (255 chars)

Name : thoroughfare
Description : Street address, Dolziger Str. 9 (255 chars)

Name : subThoroughfare
Description : house number, e.g. 9 (255 chars)

Name : locality
Description : city, e.g. Berlin (255 chars)

Name : subLocality
Description : neighborhood, common name, e.g. Mitte (255 chars)

Name : postalCode
Description : zip code, e.g. 94114 (32 chars)

Name : country
Description : country, e.g. Germany (255 chars)

Name : isoCountryCode
Description : Country Code, e.g. US (8 chars)

Name : inLandWater
Description : e.g. Lake Tahoe

Name : ocean
Description : e.g. Pacific Ocean

Name : areasOfInterest
Description : e.g. Volkspark Friedrichshain

Name : latitude
Description : Latitude

Name : longitude
Description : Longitude

Name : privateLocation
Description : private location for this user (true/false) [not yet sure what it will mean technically] -&gt; default: false

Name : notes *- required -*
Description : Scope for new notes

Name : title *- required -*
Description : Title of the note

Name : content *- required -*
Description : Content of the note


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
Authorization: Token token=cAeyTFhQkwYGXFTR07O47Ms5RC0
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/36</pre>

#### Body
```javascript
{
  "notes" : [
    {
      "title" : "Title for Note 2",
      "content" : "Liebe ist ein Kind der Freiheit!"
    },
    {
      "title" : "Title for Note 3",
      "content" : "Liebe ist ein Kind der Freiheit!"
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/36&quot; -d &#39;{&quot;notes&quot;:[{&quot;title&quot;:&quot;Title for Note 2&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;},{&quot;title&quot;:&quot;Title for Note 3&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=cAeyTFhQkwYGXFTR07O47Ms5RC0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2ac3d045eb77058b5733f87937503deb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 63dc057e-3a4e-4c23-b8f7-cc4c86ea4dd9
X-Runtime: 0.035083
Content-Length: 799</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 36,
  "title" : "Slot title 31",
  "startDate" : "2019-09-05T07:44:02.000Z",
  "createdAt" : "2015-06-15T11:19:14.496Z",
  "updatedAt" : "2015-06-15T11:19:14.496Z",
  "deletedAt" : null,
  "endDate" : "2019-10-05T07:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 169,
    "username" : "User 166",
    "createdAt" : "2015-06-15T11:19:14.492Z",
    "updatedAt" : "2015-06-15T11:19:14.492Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  },
  "notes" : [
    {
      "id" : 10,
      "title" : "Title for Note 2",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "createdAt" : "2015-06-15T11:19:14.506Z"
    },
    {
      "id" : 11,
      "title" : "Title for Note 3",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "createdAt" : "2015-06-15T11:19:14.509Z"
    }
  ],
  "photos" : [],
  "voices" : [],
  "videos" : [],
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
