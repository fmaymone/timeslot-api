# Groups API

## Add GlobalSlots to new or existing public group

### POST /v1/groups/global_group

If no global group with the given UUID exists, one is created and the name and image is set and the given GlobalSlots are added to the new group.

If a public group with the UUID exists, this one is used to add the given GlobalSlots to it and the group will be updated with new submitted values.

The GlobalSlots which aren&#39;t yet in the backend db are loaded via the candy shop.

The data must be submitted by the special **Global Importer** User. The owner if the list must be available via candy api via it&#39;s uuid.

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
  "categoryUuid" : "4870f9d3-a629-9578-edcc-3e6c954baeba",
  "group" : {
    "stringId" : "soccer_leagues:dfb.de:champions_league",
    "muid" : "41dd7dcc-b93d-4ae1-874b-4f346db49c70",
    "name" : "Autokino an der alten Eiche",
    "description" : "Bitte Autoradio nicht vergessen.",
    "image" : "http://faster.pussycat",
    "slots" : [
      "c4c59de8-83ca-8500-274b-fe16e5ef7a71"
    ]
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/global_group&quot; -d &#39;{&quot;categoryUuid&quot;:&quot;4870f9d3-a629-9578-edcc-3e6c954baeba&quot;,&quot;group&quot;:{&quot;stringId&quot;:&quot;soccer_leagues:dfb.de:champions_league&quot;,&quot;muid&quot;:&quot;41dd7dcc-b93d-4ae1-874b-4f346db49c70&quot;,&quot;name&quot;:&quot;Autokino an der alten Eiche&quot;,&quot;description&quot;:&quot;Bitte Autoradio nicht vergessen.&quot;,&quot;image&quot;:&quot;http://faster.pussycat&quot;,&quot;slots&quot;:[&quot;c4c59de8-83ca-8500-274b-fe16e5ef7a71&quot;]}}&#39; -X POST \
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
X-Request-Id: 8f4612d1-bd1f-431d-8eae-cd0d08f07b93
X-Runtime: 0.142845
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

