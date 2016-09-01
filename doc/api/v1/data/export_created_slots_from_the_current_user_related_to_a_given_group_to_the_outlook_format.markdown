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
Authorization: Token token=U39Tr4237B4YLejuyy0wZ7iO5wY
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### Body
```javascript
{
  "group" : "7ac446c5-4e8f-4010-b433-b22857de8f5a"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/outlook&quot; -d &#39;{&quot;group&quot;:&quot;7ac446c5-4e8f-4010-b433-b22857de8f5a&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=U39Tr4237B4YLejuyy0wZ7iO5wY&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;7ac446c5-4e8f-4010-b433-b22857de8f5a.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;746744fb5bb84e418089cb061f631bc5&quot;
X-Request-Id: 26bf8b64-2a10-4da2-bcbc-0b4dda4bf29b
X-Runtime: 0.007224
Content-Length: 176</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[binary data]
```
