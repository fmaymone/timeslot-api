# Groups API

## Get slots in a group

### GET /v1/groups/:group_id/slots

returns 200 and a list of all slots

returns 404 if ID is invalid

### Parameters

Name : group_id *- required -*
Description : ID of the group to get slots for


### Response Fields

Name : groupId
Description : ID of the group

Name : slotCount
Description : Number of all slot in this group

Name : upcomingCount
Description : Number of upcoming group slots

Name : slots
Description : Array of group slots

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : alerts
Description : Alerts for the slot for the current user

Name : photos
Description : Photos for the slot

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos for the slot

Name : url
Description : direct url to fetch the slot

Name : createdAt
Description : Creation datetime of the slot

Name : updatedAt
Description : Last update of the slot

Name : deletedAt
Description : Deletion datetime of the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=z86pEVa8ysaCe8PRszffKxcHgNg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/18/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/18/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=z86pEVa8ysaCe8PRszffKxcHgNg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;1543628086e78ff00739493e140d11db&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4d2647db-0ab2-4695-8536-68b74d0650b7
X-Runtime: 0.115246
Content-Length: 1316</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "groupId" : 18,
  "slotCount" : 4,
  "upcomingCount" : 0,
  "slots" : [
    {
      "id" : 19,
      "title" : "Slot title 21",
      "startDate" : "2014-09-28T13:31:02.000Z",
      "endDate" : "2014-10-22T21:44:02.000Z",
      "createdAt" : "2015-05-06T14:45:15.157Z",
      "updatedAt" : "2015-05-06T14:45:15.157Z",
      "deletedAt" : null,
      "settings" : {
        "alerts" : "0000000000"
      },
      "photos" : [],
      "voices" : [],
      "videos" : [],
      "url" : "http://example.org/v1/slots/19"
    },
    {
      "id" : 20,
      "title" : "Slot title 22",
      "startDate" : "2014-09-28T13:31:02.000Z",
      "endDate" : "2014-10-23T22:44:02.000Z",
      "createdAt" : "2015-05-06T14:45:15.162Z",
      "updatedAt" : "2015-05-06T14:45:15.162Z",
      "deletedAt" : null,
      "settings" : {
        "alerts" : "0000000000"
      },
      "photos" : [],
      "voices" : [],
      "videos" : [],
      "url" : "http://example.org/v1/slots/20"
    },
    {
      "id" : 21,
      "title" : "Slot title 23",
      "startDate" : "2014-09-28T13:31:02.000Z",
      "endDate" : "2014-10-24T23:44:02.000Z",
      "createdAt" : "2015-05-06T14:45:15.169Z",
      "updatedAt" : "2015-05-06T14:45:15.169Z",
      "deletedAt" : null,
      "settings" : {
        "alerts" : "0000000000"
      },
      "photos" : [],
      "voices" : [],
      "videos" : [],
      "url" : "http://example.org/v1/slots/21"
    },
    {
      "id" : 22,
      "title" : "Slot title 24",
      "startDate" : "2014-09-28T13:31:02.000Z",
      "endDate" : "2014-10-25T00:44:02.000Z",
      "createdAt" : "2015-05-06T14:45:15.173Z",
      "updatedAt" : "2015-05-06T14:45:15.173Z",
      "deletedAt" : null,
      "settings" : {
        "alerts" : "0000000000"
      },
      "photos" : [],
      "voices" : [],
      "videos" : [],
      "url" : "http://example.org/v1/slots/22"
    }
  ]
}</pre>
