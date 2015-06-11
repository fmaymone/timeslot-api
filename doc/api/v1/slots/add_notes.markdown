# Slots API

## Add notes

### PATCH /v1/stdslot/:id

### Parameters

Name : id *- required -*
Description : ID of the slot to update

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
Authorization: Token token=RpXwUk1lB6_E950cUHgnNVRIeEc
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
	-H &quot;Authorization: Token token=RpXwUk1lB6_E950cUHgnNVRIeEc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;95d083e8fbd2bd28f68f6ffbd2cdcaa3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 02675878-682f-4aad-85fb-9ce0188b7c6b
X-Runtime: 0.044030
Content-Length: 788</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 36,
  "title" : "Slot title 31",
  "startDate" : "2019-09-05T07:44:02.000Z",
  "createdAt" : "2015-06-11T16:20:54.612Z",
  "updatedAt" : "2015-06-11T16:20:54.612Z",
  "deletedAt" : null,
  "endDate" : "2019-10-05T07:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 169,
    "username" : "User 166",
    "createdAt" : "2015-06-11T16:20:54.607Z",
    "updatedAt" : "2015-06-11T16:20:54.607Z",
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
      "createdAt" : "2015-06-11T16:20:54.627Z"
    },
    {
      "id" : 11,
      "title" : "Title for Note 3",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "createdAt" : "2015-06-11T16:20:54.630Z"
    }
  ],
  "photos" : [],
  "voices" : [],
  "videos" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
