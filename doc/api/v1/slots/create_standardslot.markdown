# Slots API

## Create StandardSlot

### POST /v1/stdslot

Returns data of new slot.

Missing unrequiered fields will be filled with default values.

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : title *- required -*
Description : Title of slot (max. 48 characters)

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

Name : visibility *- required -*
Description : Visibility of the Slot


### Response Fields

Name : id
Description : ID of the new slot

Name : title
Description : Title of the new slot

Name : startDate
Description : Startdate of the new slot

Name : endDate
Description : Enddate of the new slot

Name : creatorId
Description : ID of the User who created the slot

Name : alerts
Description : Alerts for the slot

Name : note
Description : A Note on the slot

Name : visibility
Description : Visibility of the slot (private/friends/public)

Name : createdAt
Description : Creation datetime of the slot

Name : updatedAt
Description : Last update of the slot

Name : deletedAt
Description : Deletion datetime of the slot

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=xfHcyDHBAvnlz9fGu4y-nNN9j5c
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
  "locationId" : 200719253,
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
  "visibility" : "private"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;locationId&quot;:200719253,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;visibility&quot;:&quot;private&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=xfHcyDHBAvnlz9fGu4y-nNN9j5c&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7c16970180b36a583a06e81c6ac1e045&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 33e28eb6-2956-478a-8f44-436f6e42bd11
X-Runtime: 0.098862
Content-Length: 731</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 26,
  "title" : "Time for a Slot",
  "createdAt" : "2015-05-19T10:51:50.530Z",
  "updatedAt" : "2015-05-19T10:51:50.530Z",
  "deletedAt" : null,
  "startDate" : "2014-09-08T13:31:02.000Z",
  "endDate" : "2014-09-13T22:03:24.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 152,
    "username" : "User 149",
    "createdAt" : "2015-05-19T10:51:50.520Z",
    "updatedAt" : "2015-05-19T10:51:50.520Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0101010101"
  },
  "notes" : [
    {
      "id" : 3,
      "title" : "and another title",
      "content" : "more content here",
      "createdAt" : "2015-05-19T10:51:50.536Z"
    },
    {
      "id" : 2,
      "title" : "revolutionizing the calendar",
      "content" : "this is content",
      "createdAt" : "2015-05-19T10:51:50.533Z"
    }
  ],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}
```
