# Slots API

## Reslot a slot

### POST /v1/reslot

Returns data of new ReSlot.

returns 404 if Predecessor Slot doesn&#39;t exist

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : predecessorId *- required -*
Description : ID of the Slot which was resloted


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

Name : reslotsCounter
Description : Number of reslots for this slot

Name : slotter
Description : contains ID of the User who did reslot

Name : parent
Description : contains ID of the original slot that was reslottet

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=oiUfy8BrEuaivwUaSZHJC9ZnCW4
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/reslot</pre>

#### Body
```javascript
{
  "predecessorId" : 26
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot&quot; -d &#39;{&quot;predecessorId&quot;:26}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=oiUfy8BrEuaivwUaSZHJC9ZnCW4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0c933745fdaa8dd1c15c0da79a48b38e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b7939a56-7114-4a16-86f2-e5be8223fa0c
X-Runtime: 0.026712
Vary: Origin
Content-Length: 583</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 27,
  "title" : "Slot title 36",
  "startDate" : "2019-09-14T16:44:02.000Z",
  "createdAt" : "2015-11-17T12:12:39.539Z",
  "updatedAt" : "2015-11-17T12:12:39.539Z",
  "deletedAt" : null,
  "endDate" : "2019-10-14T16:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 184,
    "username" : "User 236",
    "createdAt" : "2015-11-17T12:12:39.517Z",
    "updatedAt" : "2015-11-17T12:12:39.517Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 186
  },
  "parent" : {
    "id" : 26
  },
  "visibility" : "public",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
