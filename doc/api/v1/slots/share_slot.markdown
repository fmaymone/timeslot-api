# Slots API

## Share slot

### GET /v1/slots/:id/share

if a user is authenticated the slot shareUrl will be included

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to share


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

<pre>Accept: application/json
Authorization: Token token=ni7ko0PbcVkRXlIyaq348jGqjB8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/42/share</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/42/share&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ni7ko0PbcVkRXlIyaq348jGqjB8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;45d48d00e28676bc8344c11f2c156e34&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a1b2964b-9542-431c-87a4-93654cfe7b95
X-Runtime: 0.021288
Vary: Origin
Content-Length: 539</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 42,
  "title" : "Slot title 105",
  "startDate" : "2019-09-02T13:44:02.000Z",
  "createdAt" : "2016-01-21T23:11:42.524Z",
  "updatedAt" : "2016-01-21T23:11:42.546Z",
  "deletedAt" : null,
  "endDate" : "2019-10-02T13:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 110,
    "username" : "User 413",
    "createdAt" : "2016-01-21T23:11:42.516Z",
    "updatedAt" : "2016-01-21T23:11:42.516Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "reslotsCounter" : 0,
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : "http://localhost:3100/Dt7ZQFxj"
}
```
