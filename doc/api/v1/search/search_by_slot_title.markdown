# Search API

## Search by slot title

### GET /v1/search/slot

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search


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

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=mnG45mM2_xNLRyVUsgRuhZd94no
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/slot?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/slot?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=mnG45mM2_xNLRyVUsgRuhZd94no&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;303e9be70a822d551080ac654ceb6a3c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a998be51-2bc6-4b21-85df-a83cd67b73de
X-Runtime: 0.027039
Content-Length: 610</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 27,
    "title" : "Timeslot Party Berlin 2015",
    "description" : "",
    "startDate" : "2019-09-09T23:44:02.000Z",
    "createdAt" : "2016-08-30T09:50:56.177Z",
    "updatedAt" : "2016-08-30T09:50:56.177Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 112,
      "username" : "User 638",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:50:56.168Z",
      "updatedAt" : "2016-08-30T09:50:56.168Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  }
]
```
