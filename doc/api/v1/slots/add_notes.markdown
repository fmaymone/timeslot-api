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

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=EOGgklpVmgjFszPmjpEV5EpeC-8
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/33</pre>

#### Body

<pre>{
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
}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot/33&quot; -d &#39;{&quot;notes&quot;:[{&quot;title&quot;:&quot;Title for Note 2&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;},{&quot;title&quot;:&quot;Title for Note 3&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=EOGgklpVmgjFszPmjpEV5EpeC-8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;788f2a334b890b0639ba8147dd0e1a09&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: befe7098-d577-4eaa-955a-f0690b007964
X-Runtime: 0.029418
Content-Length: 748</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 33,
  "title" : "Slot title 31",
  "createdAt" : "2015-05-06T14:45:16.407Z",
  "updatedAt" : "2015-05-06T14:45:16.407Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-05T07:44:02.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 155,
    "username" : "User 155",
    "createdAt" : "2015-05-06T14:45:16.406Z",
    "updatedAt" : "2015-05-06T14:45:16.406Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "notes" : [
    {
      "id" : 5,
      "title" : "Title for Note 3",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "createdAt" : "2015-05-06T14:45:16.419Z"
    },
    {
      "id" : 4,
      "title" : "Title for Note 2",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "createdAt" : "2015-05-06T14:45:16.417Z"
    }
  ],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}</pre>
