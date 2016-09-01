# Groups API

## Change default color of group

### PATCH /v1/groups/:group_uuid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to update

Name : defaultColor *- required -*
Description : new default color


### Response Fields

Name : id
Description : ID of the group

Name : name
Description : name of the group

Name : owner
Description : user info of group owner

Name : membersCanPost
Description : Can subscribers add slots?

Name : membersCanInvite
Description : Can subscribers invite friends?

Name : image
Description : URL of the group image

Name : description
Description : The description of the group

Name : defaultColor
Description : default color of the group, can be overwritten per member

Name : createdAt
Description : Creation of group

Name : updatedAt
Description : Latest update of group in db

Name : deletedAt
Description : Deletion of group

Name : membershipState
Description : Membership state for current user

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=O6rPcaX5ipdlL4xuO8AzSHSdZQ0
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/02193386-04c9-4616-b2e1-d89158df3304</pre>

#### Body
```javascript
{
  "defaultColor" : "12AB67"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/02193386-04c9-4616-b2e1-d89158df3304&quot; -d &#39;{&quot;defaultColor&quot;:&quot;12AB67&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=O6rPcaX5ipdlL4xuO8AzSHSdZQ0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;3598d1205c62de4e9e416d6532a5c665&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1f531c79-6aab-41c5-a5e9-6d2e205ebd5e
X-Runtime: 0.028442
Content-Length: 580</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "02193386-04c9-4616-b2e1-d89158df3304",
  "name" : "foo",
  "image" : "",
  "description" : "This is a description.",
  "defaultColor" : "12AB67",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : false,
  "createdAt" : "2016-08-30T09:50:50.368Z",
  "updatedAt" : "2016-08-30T09:50:50.378Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 311,
    "username" : "User 421",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:50.365Z",
    "updatedAt" : "2016-08-30T09:50:50.365Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    311
  ],
  "memberCount" : 1,
  "slotCount" : 0,
  "membershipState" : "active",
  "color" : "000000"
}
```
