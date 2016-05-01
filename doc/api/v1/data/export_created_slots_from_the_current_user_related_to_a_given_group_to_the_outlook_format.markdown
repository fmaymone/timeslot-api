# Data API

## Export created Slots from the current user related to a given Group to the Outlook format

### POST /v1/export/outlook

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.
If the parameter group is missing, all Slot will be exported.
If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=HHx4M3WP-2PjnrbHdtoBGS9ZFoA
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### Body
```javascript
{
  "group" : "42eba142-9ba4-4a88-ae17-8974679145d7"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/outlook&quot; -d &#39;{&quot;group&quot;:&quot;42eba142-9ba4-4a88-ae17-8974679145d7&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=HHx4M3WP-2PjnrbHdtoBGS9ZFoA&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;42eba142-9ba4-4a88-ae17-8974679145d7.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;746744fb5bb84e418089cb061f631bc5&quot;
X-Request-Id: ebc3b7e2-1f81-44f0-ad61-6e6e72cc945e
X-Runtime: 0.014203
Content-Length: 176</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[binary data]
```
