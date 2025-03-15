# Dokumentatsioon

## Kasutusjuhend

### Backendi käivitamine (kaust `backend`)
1. Mine kausta `backend`
2. Ava Idea IntelliJ ja impordi sisse Maveni projekt
3. Käivita FlightAppApplication
4. Backend jookseb aadressil `http://localhost:8080`

### Frontendi käivitamine (kaust `frontend`)
1. Ava kaust frontend Visual Studio Codes (või sulle meeldivas IDE-s)
2. Ava terminal ja installi kõik sõltuvused, kasutades käsklust "npm install"
3. Käivita server, kasutades käsklust "ng serve"
4. Backendiga koos töötamiseks peab server jooksma pordil nr 4200.
5. Frontend jookseb aadressil `http://localhost:4200`

### Rakenduse käivitamine Dockeris
1. Klooni projekt enda arvutisse
2. Olles projekti juurkaustas, käivita käsud `docker load -i myapp.tar` ja `docker-compose up`
3. Rakendus jookseb aadressil `http://localhost`

## Arhitektuuri ülevaade
Rakendus on jagatud kaheks osaks: frontend ja backend. 
Frontend on kirjutatud Angularis (15.2.11), backend Spring Bootis (java 23). 
Frontend ja backend suhtlevad omavahel REST API kaudu. Andmebaasina kasutatakse H2 andmebaasi.
Tabelid ja näidisandmed luuakse automaatselt, kui backend käivitatakse.
Disainis on kasutatud Bootstrapi.

Peale rakenduse käivitamist ja veebilehe avamist kuvatakse esmalt lennuplaan, mis tuleb andmebaasist.
Lennuplaani kuvamist saab filtreerida lennu väljumise kuupäeva järgi, lennu sihtkoha järgi ja lennu väljumise kellaaja järgi ning hinna järgi.
Lendu saab valida alles siis, kui on valitud reisija arv. Peale reisijate arvu valimist muutub nupp "Vali" aktiivseks.
Kui klient, valinud lennu ja reisijate arvu, avaneb lehe allosas selle lennu istekohad.
Istekohad on kolmes kategoorias: esimene klass, äriklass ja turistiklass. Omakorda on iga kategooria jagatud kaheks: akna- ja vahekohad.
Veel on rohelise raamiga märgitud kohad, mis asuvad väljapääsu juures ja osadel kohtadel on suurem jalaruum.
Istekohad on erinevate värvidega: punane - hõivatud koht, valge - vaba koht, roheline - valitud koht (algselt programmi poolt soovitatud koht).
Kohti saab kinnitada alles siis, kui on täidetud lahter "Reisija nimi". Peale reisija nime sisestamist saab istekohad kinnitada.
Peale istmete kinnitamist salvestub broneering andmebaasi.

## Probleemide lahendamine
Kõige rohkem nägin vaeva frontendiga, kuna Angular on minu jaoks uus tehnoloogia. 
Ma ei saanud tükk aega aru, kuidas kuupäeva Javast Angulari ja vastupidi saata. Palusin abi AI-lt aga sealt tuli ainult lahendusi, mis mul ei toiminud.
Tegin pikema puhkuse ja alustasin uuesti puhanud peaga ja sain lõpuks aru, kuidas seda teha.
Teine suurem probleem oli kui panin rakenduse Dockerisse. Dockeris ei saanud frontend backendist andmeid kätte, tänu CORS probleemile, 
pidin CORS-i faili backendis muutma aga mul läks aega, et aru saada, kuidas seda teha.
Alguses tegin kiirelt backendi valmis ja kui hakkasin frontendi tegema, siis sain aru, et pean tegema andmebaasi tabeleid juurde ja muutma olemasolevaid,
sest alguses olin teinud nii, et kui istmed said ühel lennul broneeritud, siis olid need istmed igal lennul broneeritud.

## Aja planeerimine
Backendile kulutasin umbes 2-3 tundi, frontendile umbes 20 tundi.

## Viited
Ai-d kasutasin päris alguses, lasin tal endale tööülesande lahti seletada ja panna paika tegevusjärjekord.
Backendis kasutasin AI abi SQL-i kirjutamisel, et lihtsalt aega kokku hoida. Frontendis kasutasin AI abi päris palju 
aga kuna tema poolt tehtud kood ei tahtnud töötada, siis pidin ise lahendusi välja mõtlema.