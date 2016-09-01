# Me API

## Get all calendars where current user is member or owner

### GET /v1/me/calendars

returns an array of calendars

### Response Fields

Name : id
Description : UUID of the calendar

Name : name
Description : name of the calendar

Name : image
Description : URL of the calendar image

Name : public
Description : visibility of the calendar

Name : owner
Description : user details of the calendar owner

Name : showInSchedule
Description : are calendar slots shown in schedule

Name : createdAt
Description : Creation datetime of the calendar

Name : updatedAt
Description : Last update of the calendaar

Name : deletedAt
Description : Deletion datetime of the calendar

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=PaLvKVFffrBXguGKJgcPOrZ3qSU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/calendars</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/calendars&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=PaLvKVFffrBXguGKJgcPOrZ3qSU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;c148bee22b52ede2658651b6b92132d1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7209885b-0fa0-4413-ba05-7e0c38df5380
X-Runtime: 0.020495
Content-Length: 1656</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "id" : "927a55e2-c202-4287-aa8f-989b818dc7de",
      "name" : "Testgroup 172",
      "image" : "",
      "description" : null,
      "defaultColor" : "000000",
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : false,
      "createdAt" : "2016-08-30T09:50:54.153Z",
      "updatedAt" : "2016-08-30T09:50:54.153Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 54,
        "username" : "User 595",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:54.109Z",
        "updatedAt" : "2016-08-30T09:50:54.109Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        54
      ],
      "memberCount" : 1,
      "slotCount" : 0,
      "showInSchedule" : false
    },
    {
      "id" : "1fd54b39-d738-4722-ba6a-b9c5c53efab7",
      "name" : "Testgroup 173",
      "image" : "",
      "description" : null,
      "defaultColor" : "000000",
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : false,
      "createdAt" : "2016-08-30T09:50:54.162Z",
      "updatedAt" : "2016-08-30T09:50:54.162Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 54,
        "username" : "User 595",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:54.109Z",
        "updatedAt" : "2016-08-30T09:50:54.109Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        54
      ],
      "memberCount" : 1,
      "slotCount" : 0,
      "showInSchedule" : false
    },
    {
      "id" : "708862bb-a532-4508-b34c-73e8ba40ff28",
      "name" : "Testgroup 174",
      "image" : "",
      "description" : null,
      "defaultColor" : "000000",
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : false,
      "createdAt" : "2016-08-30T09:50:54.168Z",
      "updatedAt" : "2016-08-30T09:50:54.168Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 54,
        "username" : "User 595",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:54.109Z",
        "updatedAt" : "2016-08-30T09:50:54.109Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        54
      ],
      "memberCount" : 1,
      "slotCount" : 0,
      "showInSchedule" : false
    }
  ]
}
```
