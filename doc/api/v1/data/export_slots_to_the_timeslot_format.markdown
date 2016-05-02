# Data API

## Export Slots to the Timeslot Format

### POST /v1/export/timeslot

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.
If the parameter group is missing, all Slot will be exported.
If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=XZsSqMeYFNVJ-tPqzNObE2ord3E
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### Body
```javascript
{
  "group" : "7fcf3c29-40c7-432d-ac5d-a9fdc95409c3"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/timeslot&quot; -d &#39;{&quot;group&quot;:&quot;7fcf3c29-40c7-432d-ac5d-a9fdc95409c3&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=XZsSqMeYFNVJ-tPqzNObE2ord3E&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;7fcf3c29-40c7-432d-ac5d-a9fdc95409c3.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;d751713988987e9331980363e24189ce&quot;
X-Request-Id: 49fc5764-bef1-4b76-aa5f-ad4b9633373f
X-Runtime: 0.004529
Content-Length: 2</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[]
```
