# Slots API

## Tagging users to a slot

### POST /v1/slots/:id/user_tags

Creates ReSlots of the given slot for the users given as User IDs in the POST parameters. Returns a list of all user IDs tagged to this slot.

returns 404 if ID is invalid.

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : id *- required -*
Description : ID of the Slot where the user should be tagged

Name : user_tags *- required -*
Description : Array of users ids which should be tagged for this slot

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=Dtz8QvORvGVT-KiGSBVpVVa063g
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/35/user_tags</pre>

#### Body
```javascript
{
  "user_tags" : [
    109,
    110,
    111
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/35/user_tags&quot; -d &#39;{&quot;user_tags&quot;:[109,110,111]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Dtz8QvORvGVT-KiGSBVpVVa063g&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 9126e5e6-3ca9-461c-a247-5f5a964abb33
X-Runtime: 0.145941
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

