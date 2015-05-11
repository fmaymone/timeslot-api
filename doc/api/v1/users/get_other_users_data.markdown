# Users API

## Get other users data

### GET /v1/users/:id

returns 404 if ID is invalid



### Parameters

Name : id *- required -*
Description : ID of the user to get


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : image
Description : URL of the user image

Name : locationId
Description : Home location of user

Name : push
Description : Send push Notifications (true/false)

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : slotCount
Description : Number of slots for this user

Name : reslotCount
Description : Number of reslots for this user

Name : friendsCount
Description : Number of friends for this user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=fe4NvUnwbgshPVa8dRkFwyQrxfE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/222</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/222&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=fe4NvUnwbgshPVa8dRkFwyQrxfE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;48b4a073c4b8fc18bfcdf1f76fb70ca6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9a2ae98b-7d37-4892-90f0-b9c3b3d47c51
X-Runtime: 0.010805
Content-Length: 205</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 222,
  "username" : "User 219",
  "locationId" : null,
  "createdAt" : "2015-05-11T14:39:14.232Z",
  "updatedAt" : "2015-05-11T14:39:14.232Z",
  "deletedAt" : null,
  "image" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0
}
```
