# Groups API

## Add GlobalSlots to new or existing public group

### POST /v1/groups/global_group

If no public group with the given UUID exists, one is created and the name and image is set and the given GlobalSlots are added to the new group.

If a public group with the UUID exists, this one is used to add the given GlobalSlots to it.

The GlobalSlots which aren&#39;t yet in the backend db are loaded via the candy shop.

The User which is used to submit the data is set as owner for created slotgroup/list. This user must be a known GlobalSlot source in the backend.

returns 200 if slots were successfully added.

returns 422 if group with given UUID exists but name doesn&#39;t match.

returns 422 if requiered parameters are missing or invalid.

### Parameters

Name : group *- required -*
Description : hash witch contains the payload

Name : muid *- required -*
Description : UUID of the group to add slots to

Name : name *- required -*
Description : Name of the group to add slots to

Name : stringId
Description : String Identifier for the group

Name : image
Description : Image URL for the group image

Name : slots
Description : Array with muid&#39;s of GlobalSlots

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=oaF7re6-O9_0xOj1kuUOR6W8OA8
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/global_group</pre>

#### Body
```javascript
{
  "group" : {
    "muid" : "ab529db3-95d5-4e3d-b55f-ee69348764f7",
    "name" : "Autokino an der alten Eiche",
    "stringId" : "soccer_leagues:dfb.de:champions_league",
    "image" : "http://faster.pussycat",
    "slots" : [
      "820304fe-a416-db0d-807e-90cb9ebd9f1b"
    ]
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/global_group&quot; -d &#39;{&quot;group&quot;:{&quot;muid&quot;:&quot;ab529db3-95d5-4e3d-b55f-ee69348764f7&quot;,&quot;name&quot;:&quot;Autokino an der alten Eiche&quot;,&quot;stringId&quot;:&quot;soccer_leagues:dfb.de:champions_league&quot;,&quot;image&quot;:&quot;http://faster.pussycat&quot;,&quot;slots&quot;:[&quot;820304fe-a416-db0d-807e-90cb9ebd9f1b&quot;]}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=oaF7re6-O9_0xOj1kuUOR6W8OA8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: d4f6667e-6f57-4da4-962b-6db01ce23542
X-Runtime: 0.100178
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

