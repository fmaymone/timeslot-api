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

Name : locationName
Description : Home location of user as String (temporary)

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
Authorization: Token token=dEuoAkA_WKejBGQchFf2i_d8Vfo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/222</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/222&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=dEuoAkA_WKejBGQchFf2i_d8Vfo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;beb60ffd4257f680baa7a7b59abdb7ee&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b4680ea3-129d-4232-8b6a-e1828eb1f556
X-Runtime: 0.014205
Content-Length: 225</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 222,
  "username" : "User 219",
  "locationId" : null,
  "locationName" : null,
  "createdAt" : "2015-05-19T10:51:52.062Z",
  "updatedAt" : "2015-05-19T10:51:52.062Z",
  "deletedAt" : null,
  "image" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0
}
```
