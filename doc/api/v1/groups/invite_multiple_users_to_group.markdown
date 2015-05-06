# Groups API

## Invite multiple users to group

### POST /v1/groups/:group_id/members

Inviting user must be group owner or group must allow invites by group members.

returns 201 if invite successfully created

returns 403 if user is not allowed to invite

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group

Name : invitees *- required -*
Description : User IDs to be invited to group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=7lKtjkPZSk1DYYvb8f2SKB5SR7E
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/25/members</pre>

#### Body

<pre>{"invitees":[105,106,107]}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/25/members&quot; -d &#39;{&quot;invitees&quot;:[105,106,107]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=7lKtjkPZSk1DYYvb8f2SKB5SR7E&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;6aa31d55cc80f5783091a38ec1cb86de&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c3615462-fdee-4c92-879f-8d8bde5d4ce0
X-Runtime: 0.033670
Content-Length: 219</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "groupId" : 25,
  "size" : 4,
  "related" : [
    {
      "userId" : 104,
      "state" : "111",
      "deletedAt" : null
    },
    {
      "userId" : 105,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 106,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 107,
      "state" : "011",
      "deletedAt" : null
    }
  ]
}</pre>
