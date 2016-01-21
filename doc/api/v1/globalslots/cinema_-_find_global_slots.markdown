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
ETag: W/&quot;00bd442fc712de1c101799b5aee5e9f4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 137d20c2-1ae7-46c6-b006-a1e52c74db2f
X-Runtime: 0.018929
Vary: Origin
Content-Length: 35660</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "muid" : "9631e9ac-1d9e-c47e-1c57-8cc760bd6957",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-08T20:40:00",
      "endDate" : "2016-01-08T22:10:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/bonn/2016/1/8",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Kinopolis,Moltkestraße 7-9,53173,Bonn",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 50.686035,
        "longitude" : 7.155684
      }
    },
    {
      "muid" : "99d502ba-c2c7-b713-2064-9fd849ca6c29",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-08T20:45:00",
      "endDate" : "2016-01-08T22:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/elmshorn/2016/1/8",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cineplex Elmshorn,Kurt-Wagener-Straße 2,25337,Elmshorn",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 53.746838,
        "longitude" : 9.696538
      }
    },
    {
      "muid" : "5a1793c4-7e03-428e-75fe-49e78af9a5fd",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-08T20:45:00",
      "endDate" : "2016-01-08T22:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/muelheim-an-der-ruhr/2016/1/8",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX,Humboldtring 5,45472,Mülheim an der Ruhr",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.439473,
        "longitude" : 6.953685
      }
    },
    {
      "muid" : "be993388-8b0b-740e-a4df-4e09a89d8a47",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-08T20:45:00",
      "endDate" : "2016-01-08T22:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/neumuenster/2016/1/8",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cineplex,Kuhberg 47-51,24534,Neumünster",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 54.07454,
        "longitude" : 9.98529
      }
    },
    {
      "muid" : "bf479586-bb89-bee5-0c55-7e8d5d292cae",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-08T20:45:00",
      "endDate" : "2016-01-08T22:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/gruenstadt/2016/1/8",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Filmwelt Grünstadt,Von-Ketteler-Ring 14,67269,Grünstadt",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.556115,
        "longitude" : 8.173275
      }
    },
    {
      "muid" : "47aea374-ead9-8199-9a79-0bf2334422ee",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-08T20:45:00",
      "endDate" : "2016-01-08T22:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/kassel/2016/1/8",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cineplex Capitol,Wilhelmsstraße 2a,34117,Kassel",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.313909,
        "longitude" : 9.49104
      }
    },
    {
      "muid" : "a3ee2fca-d4f0-3ab4-7a20-5f59a3e7edc6",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-08T20:45:00",
      "endDate" : "2016-01-08T22:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/karlsruhe/2016/1/8",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Universum-City-Kinocenter,Kaiserstraße 152-154,76133,Karlsruhe",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.010146,
        "longitude" : 8.39423
      }
    },
    {
      "muid" : "8e6264a9-6669-43da-43fd-bd643e5f91fd",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-08T20:45:00",
      "endDate" : "2016-01-08T22:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/osnabrueck/2016/1/8",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cinema-Arthouse,Erich-Maria-Remarque-Ring 16,49074,Osnabrück",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.277416229248,
        "longitude" : 8.04970550537109
      }
    },
    {
      "muid" : "b613247c-d53d-5686-362e-0904c6e5fb06",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-08T20:45:00",
      "endDate" : "2016-01-08T22:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/wallduern/2016/1/8",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Löwenlichtspiele,Hauptstraße 9,74731,Walldürn",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.584301,
        "longitude" : 9.367444
      }
    },
    {
      "muid" : "ee65448a-e888-cdc0-efca-d1bde179141f",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-08T20:45:00",
      "endDate" : "2016-01-08T22:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/stuttgart/2016/1/8",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "EM,Bolzstraße 4,70173,Stuttgart",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 48.779837,
        "longitude" : 9.179003
      }
    }
  ]
}
```
