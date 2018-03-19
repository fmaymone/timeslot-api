# Slots API

## Tagging users to a slot

### POST /v1/slots/:id/user_tags

Tagged Users are allowed to add media to the slot.

For now the slot is put into the MySchedule for the users given until we gave them a choice if or where to save it.Returns a list of all user IDs tagged to this slot.

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
Authorization: Token token=pmcBv031-K5RxnO8klQxaSTzn_k
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/34/user_tags</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/slots/34/user_tags&quot; -d &#39;{&quot;user_tags&quot;:[99,100,101]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=pmcBv031-K5RxnO8klQxaSTzn_k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 43432612-179a-42b4-b315-d27cfcf4419b
X-Runtime: 0.245636
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

