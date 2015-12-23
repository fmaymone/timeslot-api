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
Authorization: Token token=ww_r_vwPVhWyEj2A-vnRTnqxd7w
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/36/share</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/36/share&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ww_r_vwPVhWyEj2A-vnRTnqxd7w&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4883cf08320b4d2882f3b93b896ba231&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4c24e549-574d-46b8-946c-817193a54e05
X-Runtime: 0.019497
Vary: Origin
Content-Length: 537</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 36,
  "title" : "Slot title 99",
  "startDate" : "2019-09-23T07:44:02.000Z",
  "createdAt" : "2015-12-23T11:18:36.310Z",
  "updatedAt" : "2015-12-23T11:18:36.331Z",
  "deletedAt" : null,
  "endDate" : "2019-10-23T07:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 96,
    "username" : "User 391",
    "createdAt" : "2015-12-23T11:18:36.304Z",
    "updatedAt" : "2015-12-23T11:18:36.304Z",
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
  "shareUrl" : "http://localhost:3100/nFtF3YKp"
}
```
