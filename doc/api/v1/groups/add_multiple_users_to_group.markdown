# Groups API

## Add multiple users to group

### POST /v1/groups/:group_uuid/members

Adds the given Users to the group. Inviting user must be group member.

returns 201 if invite successfully created

returns 403 if user is not allowed to invite

returns 404 if group UUID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_uuid *- required -*
Description : ID of the group

Name : invitees *- required -*
Description : User IDs to be invited to group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=BAzlha_Ks3DLtYmYScNpws6x3kg
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/7529ace0-77f1-4987-a01b-0bc6765873f1/members</pre>

#### Body
```javascript
{
  "invitees" : [
    59,
    60,
    61
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/7529ace0-77f1-4987-a01b-0bc6765873f1/members&quot; -d &#39;{&quot;invitees&quot;:[59,60,61]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=BAzlha_Ks3DLtYmYScNpws6x3kg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6ccaf37facd3220229e0048cdf083b7f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b2232969-01bc-440f-af50-7bd779194b5c
X-Runtime: 0.045289
Vary: Origin
Content-Length: 242</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : "7529ace0-77f1-4987-a01b-0bc6765873f1",
  "size" : 4,
  "related" : [
    {
      "id" : 58,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 59,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 60,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 61,
      "state" : "active",
      "deletedAt" : null
    }
  ]
}
```
