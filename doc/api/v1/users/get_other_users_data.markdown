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

Name : location
Description : Home location of user

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
Authorization: Token token=w1QusUtnvLbHaTG1Wy_PQKid_X4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/227</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/227&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=w1QusUtnvLbHaTG1Wy_PQKid_X4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c4ae791a1ce0c0925b32a2454ec7bb01&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cbcc81d6-4132-4003-9e6b-ce686bdce4ad
X-Runtime: 0.037707
Content-Length: 337</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 227,
  "username" : "User 223",
  "createdAt" : "2015-06-11T16:20:56.896Z",
  "updatedAt" : "2015-06-11T16:20:56.896Z",
  "deletedAt" : null,
  "location" : {
    "id" : 3,
    "name" : "Acapulco",
    "street" : "",
    "city" : "",
    "postcode" : "",
    "country" : "",
    "latitude" : 51.234,
    "longitude" : -11.993
  },
  "image" : {
    "clyid" : null,
    "localId" : null
  },
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0
}
```
