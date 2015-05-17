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
Description : ID of the new slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : creatorId
Description : ID of the User who created the slot

Name : slotterId
Description : ID of the User who did reslot

Name : note
Description : A Note on the slot

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
Authorization: Token token=g1qP4lukMB3UjC6MBCn5AfMIHqk
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/reslot</pre>

#### Body
```javascript
{
  "predecessorId" : 30
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/reslot&quot; -d &#39;{&quot;predecessorId&quot;:30}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=g1qP4lukMB3UjC6MBCn5AfMIHqk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;f083574f0150fb8c2151e2cd7cfc9387&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d4ee1c4a-bcfe-481a-9cac-b3337dee3338
X-Runtime: 0.033193
Content-Length: 520</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 31,
  "title" : "Slot title 28",
  "createdAt" : "2015-05-06T21:29:33.236Z",
  "updatedAt" : "2015-05-06T21:29:33.236Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-02T04:44:02.000Z",
  "visibility" : null,
  "location" : null,
  "creator" : {
    "id" : 148,
    "username" : "User 148",
    "createdAt" : "2015-05-06T21:29:33.147Z",
    "updatedAt" : "2015-05-06T21:29:33.147Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "slotterId" : 150,
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}
```
