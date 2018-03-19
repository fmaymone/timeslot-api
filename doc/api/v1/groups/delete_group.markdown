# Groups API

## Delete group

### DELETE /v1/groups/:group_uuid

Sets &#39;deleted_at&#39; on the group and its memberships. Doesn&#39;t delete anything.

Current User must be group ownerreturns 200 and the updated data for the group

returns 403 if current user not group owner

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to delete

Name : keep_slots_in_schedule
Description : Set to true to prevent the removal of the calendar slots from the users schedule. Default: false


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

<pre>Authorization: Token token=Yab-_sFLVwUSUVUS0N_6-tp5VYc
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/ed8811ee-9260-40ef-b701-6cdad974c779</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/ed8811ee-9260-40ef-b701-6cdad974c779&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=Yab-_sFLVwUSUVUS0N_6-tp5VYc&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;742fce269ccd80c1896e89da3589d3c5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ca951cb3-fb24-4277-bed2-216136f53d67
X-Runtime: 0.299827
Content-Length: 590</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
