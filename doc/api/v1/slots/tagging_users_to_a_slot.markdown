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
Authorization: Token token=G9mFudujRssIFrgH9Tdpu0fomMo
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/30/user_tags</pre>

#### Body
```javascript
{
  "user_tags" : [
    89,
    90,
    91
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/30/user_tags&quot; -d &#39;{&quot;user_tags&quot;:[89,90,91]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=G9mFudujRssIFrgH9Tdpu0fomMo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 1a553c87-7b96-4c40-9d0d-92ce1dd83d3e
X-Runtime: 0.112303
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

