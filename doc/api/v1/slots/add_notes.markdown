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
Authorization: Token token=vAiVufgjdyFSCFdtZY9cF_Ebz9A
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/33</pre>

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

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot/33&quot; -d &#39;{&quot;notes&quot;:[{&quot;title&quot;:&quot;Title for Note 2&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;},{&quot;title&quot;:&quot;Title for Note 3&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=vAiVufgjdyFSCFdtZY9cF_Ebz9A&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;628c5d7913f35220fc0933d2151898b7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dfdfadbb-e722-498a-80d9-1dc4e053d5b3
X-Runtime: 0.037747
Content-Length: 748</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 33,
  "title" : "Slot title 31",
  "createdAt" : "2015-05-06T21:29:33.555Z",
  "updatedAt" : "2015-05-06T21:29:33.555Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-05T07:44:02.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 155,
    "username" : "User 155",
    "createdAt" : "2015-05-06T21:29:33.553Z",
    "updatedAt" : "2015-05-06T21:29:33.553Z",
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
      "createdAt" : "2015-05-06T21:29:33.570Z"
    },
    {
      "id" : 4,
      "title" : "Title for Note 2",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "createdAt" : "2015-05-06T21:29:33.568Z"
    }
  ],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}
```
