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

## Arhitektuuri ülevaade
Rakendus on jagatud kaheks osaks: frontend ja backend. 
Frontend on kirjutatud Angularis (TypeScript), backend Spring Bootis. 
Frontend ja backend suhtlevad omavahel REST API kaudu. Andmebaasina kasutatakse Postgre andmebaasi.
Disainis on kasutatud Bootstrapi.

Peale rakenduse käivitamist ja veebilehe avamist kuvatakse esmalt lennuplaan, mis tuleb andmebaasist. Andmebaasi tulevad lennud läbi SerpiApi.
Lennuplaani kuvamist saab filtreerida lennu väljumise kuupäeva järgi, lennu sihtkoha järgi ja lennu hinna järgi.
Kui klient on valinud lennu ja märkinud reisijate arvu, avaneb lehe allosas selle lennu istekohad.
Istekohad on kolmes kategoorias: esimene klass, äriklass ja turistiklass. Omakorda on iga kategooria jagatud kaheks: akna- ja vahekohad.
Veel on rohelise raamiga märgitud kohad, mis asuvad varuväljapääsu juures ja osadel kohtadel on suurem jalaruum.
Istekohad on erinevate värvidega: punane - hõivatud koht, valge - vaba koht, roheline - valitud koht (algselt programmi poolt soovitatud koht).
Kohti saab kinnitada alles siis, kui kasutaja on sisse loginud. Peale istmete kinnitamist salvestub broneering andmebaasi.

## Projekti eesmärk
Projekti tegin iseseisvalt, et rakendada koolis õpitut. 
Alguses tegin rakenduse nimega "FlightsSerpApi" (https://github.com/Sirvimee/FlightsSerpApi.git), mis käivitub iga päev kell 00.01 ja toob läbi SerpApi värsked lennud andmebaasi ja kustutab möödunud kuupäevadega lennud andmebaasist. Selles rakenduses sain teha läbi sammud kuidas integreerida rakendusse kolmandate osapoolte API-t ja ajastada toiminguid.
Järgmisena tegin backend rakenduse (kaustas 'backend'), mis teeb päringuid andmebaasi ja suhtleb frontendiga. Backendis on kasutatud kasutaja lisamiseks ja sisselogimiseks Spring Security´t. Nii sain praktiseerida Spring Security integreerimist.
Frontendiks valisin Angulari kuna mulle meeldib see framework, sarnanedes oma olekuga OOP-ile.
