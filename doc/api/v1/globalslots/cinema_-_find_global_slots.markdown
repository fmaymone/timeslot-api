# GlobalSlots API

## Cinema - Find global slots

### GET /v1/globalslots/search

Forwards a search request to the Elastic Search Service for global slots from the data team.

returns 422 if parameters invalid

### Parameters

Name : category *- required -*
Description : Basic slot category to search in. Valid categories: [cinema, football] 

Name : q *- required -*
Description : String to search global slots for

Name : moment
Description : find results after this datetime, default: Time.now

Name : limit
Description : maximum number of results, default: 20

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/globalslots/search?category=cinema&amp;q=James&amp;moment=2015-11-29T12%3A43%3A28.907Z&amp;limit=10</pre>

#### Query Parameters

<pre>category: cinema
q: James
moment: 2015-11-29T12:43:28.907Z
limit: 10</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/globalslots/search?category=cinema&amp;q=James&amp;moment=2015-11-29T12%3A43%3A28.907Z&amp;limit=10&quot; -X GET \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;925dcfb2e3161dee9a10d2ab99ef3edd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5f3573ce-eb13-4223-a44a-eec3a7b077bc
X-Runtime: 0.026323
Vary: Origin
Content-Length: 35003</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "muid" : null,
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-30T10:00:00",
      "endDate" : "2015-11-30T11:30:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/berlin/2015/11/30",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cineplex Titania",
        "locality" : "berlin",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.464099,
        "longitude" : 13.326431
      }
    },
    {
      "muid" : null,
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-30T10:00:00",
      "endDate" : "2015-11-30T11:30:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/berlin/2015/11/30",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cineplex Spandau",
        "locality" : "berlin",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.538482,
        "longitude" : 13.206316
      }
    },
    {
      "muid" : null,
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-30T10:00:00",
      "endDate" : "2015-11-30T11:30:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/muenchen/2015/11/30",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Mathäser Filmpalast",
        "locality" : "muenchen",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 48.13914,
        "longitude" : 11.563652
      }
    },
    {
      "muid" : null,
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-30T11:30:00",
      "endDate" : "2015-11-30T13:00:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/nuernberg/2015/11/30",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cinecitta",
        "locality" : "nuernberg",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.45204,
        "longitude" : 11.083265
      }
    },
    {
      "muid" : null,
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-30T11:55:00",
      "endDate" : "2015-11-30T13:25:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/nuernberg/2015/11/30",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cinecitta",
        "locality" : "nuernberg",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.45204,
        "longitude" : 11.083265
      }
    },
    {
      "muid" : null,
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-30T12:00:00",
      "endDate" : "2015-11-30T13:30:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/berlin/2015/11/30",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX",
        "locality" : "berlin",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.508971,
        "longitude" : 13.373409
      }
    },
    {
      "muid" : null,
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-30T12:30:00",
      "endDate" : "2015-11-30T14:00:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/berlin/2015/11/30",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX",
        "locality" : "berlin",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.508971,
        "longitude" : 13.373409
      }
    },
    {
      "muid" : null,
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-30T12:45:00",
      "endDate" : "2015-11-30T14:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/berlin/2015/11/30",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cinestar IMAX im Sony Center",
        "locality" : "berlin",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.509579,
        "longitude" : 13.372767
      }
    },
    {
      "muid" : null,
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-30T13:00:00",
      "endDate" : "2015-11-30T14:30:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/berlin/2015/11/30",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cineplex Titania",
        "locality" : "berlin",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.464099,
        "longitude" : 13.326431
      }
    },
    {
      "muid" : null,
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-30T13:00:00",
      "endDate" : "2015-11-30T14:30:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/berlin/2015/11/30",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Alhambra",
        "locality" : "berlin",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.550502,
        "longitude" : 13.351114
      }
    }
  ]
}
```
