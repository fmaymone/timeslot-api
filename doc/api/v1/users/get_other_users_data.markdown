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
Authorization: Token token=v6ah3Uh_Ap0Acx7Ti9T4ZG3ALbs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/276</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/276&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=v6ah3Uh_Ap0Acx7Ti9T4ZG3ALbs&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;50d5b0ee0c2318d9c0b908164f0e1e69&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9e95d1b7-2e2f-47eb-9c74-5e79b445cba3
X-Runtime: 0.012091
Content-Length: 308</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 276,
  "username" : "User 272",
  "createdAt" : "2015-06-03T10:39:40.106Z",
  "updatedAt" : "2015-06-03T10:39:40.106Z",
  "deletedAt" : null,
  "location" : {
    "id" : 52,
    "name" : "Acapulco",
    "street" : "",
    "city" : "",
    "postcode" : "",
    "country" : "",
    "latitude" : null,
    "longitude" : null
  },
  "image" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0
}
```
