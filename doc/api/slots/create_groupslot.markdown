# Slots API

## Create GroupSlot

### POST /v1/groupslot

Returns data of new slot.

Missing unrequiered fields will be filled with default values.

returns 404 if Group ID is invalid

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : title *- required -*
Description : Title of slot (max. 48 characters)

Name : startDate *- required -*
Description : Startdate and Time of the Slot

Name : endDate *- required -*
Description : Enddate and Time of the Slot (startdate + duration)

Name : groupId *- required -*
Description : Group ID if GroupSlot

Name : note
Description : A note which belongs to the Slot

Name : settings
Description : User specific settings for the slot (alerts)

Name : alerts
Description : Alerts for the Slot


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

Name : groupId
Description : ID of the group the slot belongs to

Name : createdAt
Description : Creation datetime of the slot

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=yZfZ9Jxua8iauRiAsuZhYzpFOCE
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groupslot</pre>

#### Body

<pre>{"title":"Time for a Slot","startDate":"2014-09-08T13:31:02.000Z","endDate":"2014-09-13T22:03:24.000Z","groupId":38,"note":"revolutionizing the calendar","settings":{"alerts":"0101010101"}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groupslot&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;groupId&quot;:38,&quot;note&quot;:&quot;revolutionizing the calendar&quot;,&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=yZfZ9Jxua8iauRiAsuZhYzpFOCE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;89800891da7e034f4b26e7ec191e5fca&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ba16675c-b163-4c9a-a06a-1879fc1a6dbc
X-Runtime: 0.030913
Content-Length: 524</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "id" : 28,
  "title" : "Time for a Slot",
  "createdAt" : "2015-05-06T11:28:50.790Z",
  "updatedAt" : "2015-05-06T11:28:50.790Z",
  "deletedAt" : null,
  "startDate" : "2014-09-08T13:31:02.000Z",
  "endDate" : "2014-09-13T22:03:24.000Z",
  "visibility" : "members",
  "location" : null,
  "creator" : {
    "id" : 145,
    "username" : "User 145",
    "createdAt" : "2015-05-06T11:28:50.767Z",
    "updatedAt" : "2015-05-06T11:28:50.767Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0101010101"
  },
  "groupId" : 38,
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}</pre>
