# Groups API

## Update existing global group

### POST /v1/groups/global_group

Check for existing global group via **string_id**, If the global group is already known in the backend it will be updated with the submitted group params.

returns 200 if slots were successfully added.

returns 422 if group with given UUID exists but name doesn&#39;t match.

returns 422 if requiered parameters are missing or invalid.

### Parameters

Name : categoryUuid *- required -*
Description : UUID for the global slot category to which the group/calendar belongs

Name : group *- required -*
Description : hash witch contains the payload

Name : stringId *- required -*
Description : String Identifier for the group

Name : muid
Description : UUID of the group to add slots to

Name : name
Description : Name of the group to add slots to

Name : description
Description : The description of the group

Name : image
Description : Image URL for the group image

Name : slots
Description : Array with muid&#39;s of GlobalSlots

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=JJdDO4gCtjOPgPkySfzn1cOAUn8
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/global_group</pre>

#### Body
```javascript
{
  "categoryUuid" : "74234fc9-5543-6b0f-bdb5-66ed52e2d787",
  "group" : {
    "stringId" : "tu_berlin_classes:lsf.tu-berlin.de:0401 L 145:180786:373591",
    "muid" : "d448ce44-cd5b-efac-ef95-b84a70001906",
    "name" : "Berechenbarkeit und Komplexitaet",
    "description" : "Vl. Mi 14:00 - 16:00, 0401 L 145, Raum: ER 270",
    "slots" : [
      "5b012024-e614-83cb-63a6-165d4716c892"
    ]
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/global_group&quot; -d &#39;{&quot;categoryUuid&quot;:&quot;74234fc9-5543-6b0f-bdb5-66ed52e2d787&quot;,&quot;group&quot;:{&quot;stringId&quot;:&quot;tu_berlin_classes:lsf.tu-berlin.de:0401 L 145:180786:373591&quot;,&quot;muid&quot;:&quot;d448ce44-cd5b-efac-ef95-b84a70001906&quot;,&quot;name&quot;:&quot;Berechenbarkeit und Komplexitaet&quot;,&quot;description&quot;:&quot;Vl. Mi 14:00 - 16:00, 0401 L 145, Raum: ER 270&quot;,&quot;slots&quot;:[&quot;5b012024-e614-83cb-63a6-165d4716c892&quot;]}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=JJdDO4gCtjOPgPkySfzn1cOAUn8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: a311e032-45a3-4567-8f9d-f60d002fcd39
X-Runtime: 0.151641
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

