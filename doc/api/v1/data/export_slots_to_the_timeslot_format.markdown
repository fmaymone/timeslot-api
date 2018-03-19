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
Authorization: Token token=z9qS7hhbzDIKy9rKlgOjj2wzW4E
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/timeslot&quot; -d &#39;{&quot;group&quot;:&quot;7ad5a286-0145-46ac-b6bf-e2f004e3f35d&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=z9qS7hhbzDIKy9rKlgOjj2wzW4E&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;7ad5a286-0145-46ac-b6bf-e2f004e3f35d.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;d751713988987e9331980363e24189ce&quot;
X-Request-Id: c029bd42-212e-4e44-9b28-1c45e847bac7
X-Runtime: 0.014117
Content-Length: 2</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
