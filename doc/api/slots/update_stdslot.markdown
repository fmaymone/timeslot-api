# Slots API

## Update StdSlot

### PATCH /v1/stdslot/:id

Update content of StdSlot.

User must be owner of StdSlot.

returns 200 and slot data if update succeded 

returns 404 if User not owner or ID is invalid

returns 422 if parameters are invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to update

Name : title
Description : Updated title of slot

Name : startDate
Description : Updated Startdate and Time of the Slot

Name : endDate
Description : Updated Enddate and Time of the Slot (startdate + duration)

Name : locationId
Description : Location ID

Name : visibility
Description : Visibility of slot

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=-z6EOfF4jepi--sN9ZILhst69Nc
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/32</pre>

#### Body
```javascript
{
  "title" : "New title for a Slot"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot/32&quot; -d &#39;{&quot;title&quot;:&quot;New title for a Slot&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=-z6EOfF4jepi--sN9ZILhst69Nc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b748fd48bdc851c28c3270aaa103682e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a9f8d865-98a8-417e-ac9e-422e7f0d4560
X-Runtime: 0.030776
Content-Length: 516</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 32,
  "title" : "New title for a Slot",
  "createdAt" : "2015-05-19T10:51:50.855Z",
  "updatedAt" : "2015-05-19T10:51:50.855Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-04T06:44:02.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 163,
    "username" : "User 160",
    "createdAt" : "2015-05-19T10:51:50.853Z",
    "updatedAt" : "2015-05-19T10:51:50.853Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}
```
