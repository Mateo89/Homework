Skrypty generujace pliki docker-compose na podstawie konfiguracji.

UWAGA!!
Skrypty należy uruchomić po przejsciu w konsoli do folderu full-version.

W pierwszej kolejności należy uruchomić skrypt ./configure.sh.
Zostanie zadany ciąg pytań na które należy odpowiedzieć.
Wynikiem będzie utworzenie pliku config.cfg zawierającego odpowiedzi na wcześniejsze pytania.

Nastepnie uruchamiamy skrypt ./make.sh który w katalogu build wygeneruje konfigurację dla docker-compose.
Tak gotowe pliki używamy dla utworzenia środowiska za pomocą docker-compose.
