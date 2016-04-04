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

<pre>GET /v1/globalslots/search?category=cinema&amp;q=Love&amp;moment=2016-07-29T12%3A43%3A28.907Z&amp;limit=10</pre>

#### Query Parameters

<pre>category: cinema
q: Love
moment: 2016-07-29T12:43:28.907Z
limit: 10</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/globalslots/search?category=cinema&amp;q=Love&amp;moment=2016-07-29T12%3A43%3A28.907Z&amp;limit=10&quot; -X GET </pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;003a8bfc694dfbf1097b0ea0a37607cc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8ae9bcc3-57cf-4fd5-b421-1705d9fcf41e
X-Runtime: 0.018354
Vary: Origin
Content-Length: 19465</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "muid" : "8bae0d0f-4c88-a474-23be-1c1c74c9a34b",
      "title" : "We love to Dance",
      "startDate" : "2016-04-05T12:15:00",
      "endDate" : "2016-04-05T14:15:00",
      "image" : "http://assets.cdn.moviepilot.de/files/c65ac2b44c4a33456e10511f68fca0b64ff77637f16f7ed3cbaf4f6b982c/fill/168/240/We-Love-To-Dance-Poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/muenster/2016/4/5",
      "description" : "Handlung von We Love to DanceTu (Tia Maipi) lebt in einem Vorort von Auckland in eher bescheidenen Verhältnissen. Sein Vater, ein Sergeant in der neuseeländischen Armee, stellt ihm ein Ultimatum: Tu soll bis zum Ende des Sommers seine wahre Berufung finden, andernfalls muss er seinen Militärdienst leisten.Tu hegt allerdings nicht die Absicht, Soldat zu werden. Im Hip-Hop-Tanz sieht er seine Chance, der Armee zu entkommen. Er hat genau sechs Wochen Zeit, um sein Talent zu zeigen und von einer internationalen Tänzergruppe aufgenommen zu werden. Es ist also kein Wunder, dass er trainiert, als würde es um sein Leben gehen.Hintergrund & Infos zu We Love to DanceDie neuseeländische Produktion We Love to Dance (OT: Born to Dance) von Tammy Davis wurde im Februar 2016 in der Sektion Generation 14plus der 66. Berlinale gezeigt. (MJ)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cineplex, Albersloher Weg 14, 48155, Münster",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.95055,
        "longitude" : 7.63672
      }
    },
    {
      "muid" : "45098a13-3aac-784b-96c2-54542c0a527e",
      "title" : "We love to Dance",
      "startDate" : "2016-04-05T12:30:00",
      "endDate" : "2016-04-05T14:30:00",
      "image" : "http://assets.cdn.moviepilot.de/files/c65ac2b44c4a33456e10511f68fca0b64ff77637f16f7ed3cbaf4f6b982c/fill/168/240/We-Love-To-Dance-Poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/muenchen/2016/4/5",
      "description" : "Handlung von We Love to DanceTu (Tia Maipi) lebt in einem Vorort von Auckland in eher bescheidenen Verhältnissen. Sein Vater, ein Sergeant in der neuseeländischen Armee, stellt ihm ein Ultimatum: Tu soll bis zum Ende des Sommers seine wahre Berufung finden, andernfalls muss er seinen Militärdienst leisten.Tu hegt allerdings nicht die Absicht, Soldat zu werden. Im Hip-Hop-Tanz sieht er seine Chance, der Armee zu entkommen. Er hat genau sechs Wochen Zeit, um sein Talent zu zeigen und von einer internationalen Tänzergruppe aufgenommen zu werden. Es ist also kein Wunder, dass er trainiert, als würde es um sein Leben gehen.Hintergrund & Infos zu We Love to DanceDie neuseeländische Produktion We Love to Dance (OT: Born to Dance) von Tammy Davis wurde im Februar 2016 in der Sektion Generation 14plus der 66. Berlinale gezeigt. (MJ)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Mathäser Filmpalast, Bayerstraße 5, 80335, München",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 48.1457672119141,
        "longitude" : 11.5534410476685
      }
    },
    {
      "muid" : "8018671a-c2b0-62ce-7ae9-2de84c15212a",
      "title" : "We love to Dance",
      "startDate" : "2016-04-05T13:15:00",
      "endDate" : "2016-04-05T15:15:00",
      "image" : "http://assets.cdn.moviepilot.de/files/c65ac2b44c4a33456e10511f68fca0b64ff77637f16f7ed3cbaf4f6b982c/fill/168/240/We-Love-To-Dance-Poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/kaiserslautern/2016/4/5",
      "description" : "Handlung von We Love to DanceTu (Tia Maipi) lebt in einem Vorort von Auckland in eher bescheidenen Verhältnissen. Sein Vater, ein Sergeant in der neuseeländischen Armee, stellt ihm ein Ultimatum: Tu soll bis zum Ende des Sommers seine wahre Berufung finden, andernfalls muss er seinen Militärdienst leisten.Tu hegt allerdings nicht die Absicht, Soldat zu werden. Im Hip-Hop-Tanz sieht er seine Chance, der Armee zu entkommen. Er hat genau sechs Wochen Zeit, um sein Talent zu zeigen und von einer internationalen Tänzergruppe aufgenommen zu werden. Es ist also kein Wunder, dass er trainiert, als würde es um sein Leben gehen.Hintergrund & Infos zu We Love to DanceDie neuseeländische Produktion We Love to Dance (OT: Born to Dance) von Tammy Davis wurde im Februar 2016 in der Sektion Generation 14plus der 66. Berlinale gezeigt. (MJ)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Central City Cinemas, Münchstraße 8, 67655, Kaiserslautern",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.4437799,
        "longitude" : 7.77115
      }
    },
    {
      "muid" : "f97b83ad-8ca8-9d88-97e1-3bfebee7d363",
      "title" : "We love to Dance",
      "startDate" : "2016-04-05T15:00:00",
      "endDate" : "2016-04-05T17:00:00",
      "image" : "http://assets.cdn.moviepilot.de/files/c65ac2b44c4a33456e10511f68fca0b64ff77637f16f7ed3cbaf4f6b982c/fill/168/240/We-Love-To-Dance-Poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/schweinfurt/2016/4/5",
      "description" : "Handlung von We Love to DanceTu (Tia Maipi) lebt in einem Vorort von Auckland in eher bescheidenen Verhältnissen. Sein Vater, ein Sergeant in der neuseeländischen Armee, stellt ihm ein Ultimatum: Tu soll bis zum Ende des Sommers seine wahre Berufung finden, andernfalls muss er seinen Militärdienst leisten.Tu hegt allerdings nicht die Absicht, Soldat zu werden. Im Hip-Hop-Tanz sieht er seine Chance, der Armee zu entkommen. Er hat genau sechs Wochen Zeit, um sein Talent zu zeigen und von einer internationalen Tänzergruppe aufgenommen zu werden. Es ist also kein Wunder, dass er trainiert, als würde es um sein Leben gehen.Hintergrund & Infos zu We Love to DanceDie neuseeländische Produktion We Love to Dance (OT: Born to Dance) von Tammy Davis wurde im Februar 2016 in der Sektion Generation 14plus der 66. Berlinale gezeigt. (MJ)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Filmwelt, Am Oberen Marienbach 3, 97421, Schweinfurt",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 50.04752,
        "longitude" : 10.2358499
      }
    },
    {
      "muid" : "bb03916a-8630-b192-b913-f32ffd0b958e",
      "title" : "We love to Dance",
      "startDate" : "2016-04-06T12:30:00",
      "endDate" : "2016-04-06T14:30:00",
      "image" : "http://assets.cdn.moviepilot.de/files/c65ac2b44c4a33456e10511f68fca0b64ff77637f16f7ed3cbaf4f6b982c/fill/168/240/We-Love-To-Dance-Poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/muenchen/2016/4/6",
      "description" : "Handlung von We Love to DanceTu (Tia Maipi) lebt in einem Vorort von Auckland in eher bescheidenen Verhältnissen. Sein Vater, ein Sergeant in der neuseeländischen Armee, stellt ihm ein Ultimatum: Tu soll bis zum Ende des Sommers seine wahre Berufung finden, andernfalls muss er seinen Militärdienst leisten.Tu hegt allerdings nicht die Absicht, Soldat zu werden. Im Hip-Hop-Tanz sieht er seine Chance, der Armee zu entkommen. Er hat genau sechs Wochen Zeit, um sein Talent zu zeigen und von einer internationalen Tänzergruppe aufgenommen zu werden. Es ist also kein Wunder, dass er trainiert, als würde es um sein Leben gehen.Hintergrund & Infos zu We Love to DanceDie neuseeländische Produktion We Love to Dance (OT: Born to Dance) von Tammy Davis wurde im Februar 2016 in der Sektion Generation 14plus der 66. Berlinale gezeigt. (MJ)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Mathäser Filmpalast, Bayerstraße 5, 80335, München",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 48.1457672119141,
        "longitude" : 11.5534410476685
      }
    },
    {
      "muid" : "b9b4eb6c-6121-101d-ee22-7f968c713127",
      "title" : "We love to Dance",
      "startDate" : "2016-04-06T15:00:00",
      "endDate" : "2016-04-06T17:00:00",
      "image" : "http://assets.cdn.moviepilot.de/files/c65ac2b44c4a33456e10511f68fca0b64ff77637f16f7ed3cbaf4f6b982c/fill/168/240/We-Love-To-Dance-Poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/schweinfurt/2016/4/6",
      "description" : "Handlung von We Love to DanceTu (Tia Maipi) lebt in einem Vorort von Auckland in eher bescheidenen Verhältnissen. Sein Vater, ein Sergeant in der neuseeländischen Armee, stellt ihm ein Ultimatum: Tu soll bis zum Ende des Sommers seine wahre Berufung finden, andernfalls muss er seinen Militärdienst leisten.Tu hegt allerdings nicht die Absicht, Soldat zu werden. Im Hip-Hop-Tanz sieht er seine Chance, der Armee zu entkommen. Er hat genau sechs Wochen Zeit, um sein Talent zu zeigen und von einer internationalen Tänzergruppe aufgenommen zu werden. Es ist also kein Wunder, dass er trainiert, als würde es um sein Leben gehen.Hintergrund & Infos zu We Love to DanceDie neuseeländische Produktion We Love to Dance (OT: Born to Dance) von Tammy Davis wurde im Februar 2016 in der Sektion Generation 14plus der 66. Berlinale gezeigt. (MJ)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Filmwelt, Am Oberen Marienbach 3, 97421, Schweinfurt",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 50.04752,
        "longitude" : 10.2358499
      }
    },
    {
      "muid" : "4e5a5591-afb9-ed26-c1fd-c20ba1d8fdf1",
      "title" : "Italy, Love It or Leave It",
      "startDate" : "2016-04-06T18:00:00",
      "endDate" : "2016-04-06T20:00:00",
      "image" : "http://assets.cdn.moviepilot.de/files/655f16c1c574965f5f11c1d6597fbfbf460f57a8612ed44ce4fc06a2dbc4/fill/168/240/poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/regensburg/2016/4/6",
      "description" : "Gustav Hofer würde nichts lieber, als endlich Italien zu verlassen und nach Berlin zu ziehen. Sein Lebensgefährte Luca Ragazzi sieht nach wie vor den Charme Italiens und möchte Gustav wieder von seiner Heimat begeistern. Um ihn zu überzeugen schlägt Luca einen Roadtrip vor, der die beiden wieder an die Wunder Italiens erinnern soll. Die Idee endet in einer chaotischen Tour in einem antiken Fiat 500, der sie über veralte Landstraßen führt. Auf ihrem Weg vorbei an italienischem Trash-TV und Berlusconi-vernarrten Dorfbewohnern lassen sich Gustav und Luca ihr Heimatland von Landsleuten erklären. Aufgelockert werden die ernsten Problemthemen durch Unterhaltungen des Paares im Auto und gelegentliche Animationen. Hintergrund & Infos zu Italy, Love It or Leave It Nach Schwulsein auf Italienisch (auch bekannt unter dem Titel ‘Plötzlich letzten Winter’) ist Italy, Love It or Leave It der zweite preisgekrönte Dokumentarfilm von Hofer und Ragazzi. Er gewann den Publikumspreis des Thessaloniki Documentary Film Festivals. (LB)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Kinos im Andreasstadl, Andreasstraße 28, 93059, Regensburg",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.0309753417969,
        "longitude" : 12.0852108001709
      }
    },
    {
      "muid" : "5e75340c-d372-2c5e-1f81-c42467fb3350",
      "title" : "Love",
      "startDate" : "2016-04-07T19:00:00",
      "endDate" : "2016-04-07T21:00:00",
      "image" : "http://assets.cdn.moviepilot.de/files/62887af5b2f7da2c5aed3e90429a7bf9dec1a03441ab45c404c3f1feaa98/fill/168/240/Poster-Love.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/kiel/2016/4/7",
      "description" : "Love ist ein in 3D gedrehtes erotisches Drama von Gaspar Noé über eine Dreiecksbeziehung zwischen zwei Frauen und einem Mann. Handlung von Love Love – Liebe – haben Murphy (Karl Glusman) und Electra (Aomi Muyock) einst füreinander empfunden. Zwei Jahre lang waren die beiden ein Paar. Doch dann schlief der Filmstudent mit einer anderen Frau, Omi (Klara Kristin), und deren folgende Schwangerschaft beendete Murphys und Electras Beziehung ein für allemal. Als Murphy einige Zeit nach der Trennung eines Morgens von Electras Mutter Nora (Isabelle Nicou) kontaktiert wird, weil diese lange nichts von ihrer Tochter gehört hat und einen Suizid-Versuch befürchtet, erinnert sich Murphy an all die gemeinsamen Momente, die das Paar im Strudel von Drogen, Sex und Zärtlichkeit verbracht hat. Hintergrund & Infos zu Love Gaspar Noé ist vor allem durch seinen Film Irreversibel bekannt. Die offen dargestellte Gewalt sowie eine viertelstündige Vergewaltigungsszene brachte ihm den Titel des Skandal-Regisseurs ein. Dennoch wurde der Film 2002 für die Goldene Palme in Cannes nominiert. Auch Love lief 2015 auf dem Filmfestival in Cannes, diesmal im Midnight Screening. Gaspar Noé drehte und vermarktete sein erotisches Melodrama anschließend mit einem besonderen Verkaufsargument: Nämlich, dass er sein von vielen Geschlechtsakten geprägtes Werk in 3D gedreht hatte. Die meisten Sex-Szenen folgten dabei keiner konkreten Choreografie. Stattdessen ließ der Regisseur seinen Darstellern Freiraum, nach ihren eigenen Entscheidungen zu agieren. Produziert wurde Love unter anderem von Vincent Maraval, der bereits Blau ist eine warme Farbe mitfinanziert hatte, einen Film um zwei lesbische Frauen, der in Cannes 2013 die goldene Palme für die besten Darstellerinnen und den besten Regisseur gewann. Love wurde in Paris gedreht. Für die zwei Hauptdarstellerinnen Aomi Muyock und Klara Kristin ist das Erotikdrama ihr schauspielerisches Filmdebüt. Gaspar Noé traf die zwei Frauen in einem Club. Der männliche Protagonist, Karl Glusman, wurde ihm hingegen von einem Freund für die Rolle empfohlen. (ES)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Kommunales Kino in der Pumpe, Haßstraße 22, 24103, Kiel",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 54.3227195739746,
        "longitude" : 10.1328811645508
      }
    },
    {
      "muid" : "712da8b6-7f4f-705b-89a9-d8223b7d574d",
      "title" : "Love",
      "startDate" : "2016-04-08T19:00:00",
      "endDate" : "2016-04-08T21:00:00",
      "image" : "http://assets.cdn.moviepilot.de/files/62887af5b2f7da2c5aed3e90429a7bf9dec1a03441ab45c404c3f1feaa98/fill/168/240/Poster-Love.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/kiel/2016/4/8",
      "description" : "Love ist ein in 3D gedrehtes erotisches Drama von Gaspar Noé über eine Dreiecksbeziehung zwischen zwei Frauen und einem Mann. Handlung von Love Love – Liebe – haben Murphy (Karl Glusman) und Electra (Aomi Muyock) einst füreinander empfunden. Zwei Jahre lang waren die beiden ein Paar. Doch dann schlief der Filmstudent mit einer anderen Frau, Omi (Klara Kristin), und deren folgende Schwangerschaft beendete Murphys und Electras Beziehung ein für allemal. Als Murphy einige Zeit nach der Trennung eines Morgens von Electras Mutter Nora (Isabelle Nicou) kontaktiert wird, weil diese lange nichts von ihrer Tochter gehört hat und einen Suizid-Versuch befürchtet, erinnert sich Murphy an all die gemeinsamen Momente, die das Paar im Strudel von Drogen, Sex und Zärtlichkeit verbracht hat. Hintergrund & Infos zu Love Gaspar Noé ist vor allem durch seinen Film Irreversibel bekannt. Die offen dargestellte Gewalt sowie eine viertelstündige Vergewaltigungsszene brachte ihm den Titel des Skandal-Regisseurs ein. Dennoch wurde der Film 2002 für die Goldene Palme in Cannes nominiert. Auch Love lief 2015 auf dem Filmfestival in Cannes, diesmal im Midnight Screening. Gaspar Noé drehte und vermarktete sein erotisches Melodrama anschließend mit einem besonderen Verkaufsargument: Nämlich, dass er sein von vielen Geschlechtsakten geprägtes Werk in 3D gedreht hatte. Die meisten Sex-Szenen folgten dabei keiner konkreten Choreografie. Stattdessen ließ der Regisseur seinen Darstellern Freiraum, nach ihren eigenen Entscheidungen zu agieren. Produziert wurde Love unter anderem von Vincent Maraval, der bereits Blau ist eine warme Farbe mitfinanziert hatte, einen Film um zwei lesbische Frauen, der in Cannes 2013 die goldene Palme für die besten Darstellerinnen und den besten Regisseur gewann. Love wurde in Paris gedreht. Für die zwei Hauptdarstellerinnen Aomi Muyock und Klara Kristin ist das Erotikdrama ihr schauspielerisches Filmdebüt. Gaspar Noé traf die zwei Frauen in einem Club. Der männliche Protagonist, Karl Glusman, wurde ihm hingegen von einem Freund für die Rolle empfohlen. (ES)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Kommunales Kino in der Pumpe, Haßstraße 22, 24103, Kiel",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 54.3227195739746,
        "longitude" : 10.1328811645508
      }
    },
    {
      "muid" : "e1f28c3d-b884-6b75-c4d3-41ee05e71784",
      "title" : "Love",
      "startDate" : "2016-04-09T19:00:00",
      "endDate" : "2016-04-09T21:00:00",
      "image" : "http://assets.cdn.moviepilot.de/files/62887af5b2f7da2c5aed3e90429a7bf9dec1a03441ab45c404c3f1feaa98/fill/168/240/Poster-Love.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/kiel/2016/4/9",
      "description" : "Love ist ein in 3D gedrehtes erotisches Drama von Gaspar Noé über eine Dreiecksbeziehung zwischen zwei Frauen und einem Mann. Handlung von Love Love – Liebe – haben Murphy (Karl Glusman) und Electra (Aomi Muyock) einst füreinander empfunden. Zwei Jahre lang waren die beiden ein Paar. Doch dann schlief der Filmstudent mit einer anderen Frau, Omi (Klara Kristin), und deren folgende Schwangerschaft beendete Murphys und Electras Beziehung ein für allemal. Als Murphy einige Zeit nach der Trennung eines Morgens von Electras Mutter Nora (Isabelle Nicou) kontaktiert wird, weil diese lange nichts von ihrer Tochter gehört hat und einen Suizid-Versuch befürchtet, erinnert sich Murphy an all die gemeinsamen Momente, die das Paar im Strudel von Drogen, Sex und Zärtlichkeit verbracht hat. Hintergrund & Infos zu Love Gaspar Noé ist vor allem durch seinen Film Irreversibel bekannt. Die offen dargestellte Gewalt sowie eine viertelstündige Vergewaltigungsszene brachte ihm den Titel des Skandal-Regisseurs ein. Dennoch wurde der Film 2002 für die Goldene Palme in Cannes nominiert. Auch Love lief 2015 auf dem Filmfestival in Cannes, diesmal im Midnight Screening. Gaspar Noé drehte und vermarktete sein erotisches Melodrama anschließend mit einem besonderen Verkaufsargument: Nämlich, dass er sein von vielen Geschlechtsakten geprägtes Werk in 3D gedreht hatte. Die meisten Sex-Szenen folgten dabei keiner konkreten Choreografie. Stattdessen ließ der Regisseur seinen Darstellern Freiraum, nach ihren eigenen Entscheidungen zu agieren. Produziert wurde Love unter anderem von Vincent Maraval, der bereits Blau ist eine warme Farbe mitfinanziert hatte, einen Film um zwei lesbische Frauen, der in Cannes 2013 die goldene Palme für die besten Darstellerinnen und den besten Regisseur gewann. Love wurde in Paris gedreht. Für die zwei Hauptdarstellerinnen Aomi Muyock und Klara Kristin ist das Erotikdrama ihr schauspielerisches Filmdebüt. Gaspar Noé traf die zwei Frauen in einem Club. Der männliche Protagonist, Karl Glusman, wurde ihm hingegen von einem Freund für die Rolle empfohlen. (ES)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Kommunales Kino in der Pumpe, Haßstraße 22, 24103, Kiel",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 54.3227195739746,
        "longitude" : 10.1328811645508
      }
    }
  ]
}
```
