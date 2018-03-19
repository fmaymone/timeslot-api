# Users API

## Get basic data for User

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

Name : firstName
Description : First name of the user

Name : middleName
Description : Middle name of the user

Name : lastName
Description : Last name of the user

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : slotCount
Description : Number of visible slots for this user

Name : calendarCount
Description : Number of visible calendars for this user

Name : friendsCount
Description : Number of friends for this user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=WYgCPMBuN87tqsfSbX-FElJMYyE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/116</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/116&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=WYgCPMBuN87tqsfSbX-FElJMYyE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;e7182dd902b4f9749e69a935441cf3b8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6ebe5a27-8602-41b5-8e08-1a7f9d98bd39
X-Runtime: 0.089747
Content-Length: 656</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
