render_template() {
  eval "echo \"$(cat $1)\""
}

clear

echo ""
echo "BUDOWANIE ZADANIA NA PODSTAWIE KONFIGURACJI"
echo ""


#sprawdzenie czy plik config.cfg istnieje

if [ ! -f config.cfg ]; then
    echo "BRAK PLIKU CONFIG.CFG !"
    echo "URUCHOM CONFIGURE.SH"
    exit
fi

echo -ne "POBIERANIE KONFIGURACJI ... \t\t"
source config.cfg
echo -e "[ \e[0;32m OK \e[0m ]"

#jeżeli katalog build nie istnieje tworzymy
if [ ! -d build ]; then
    mkdir build
fi

echo ""
echo "RENDERUJĘ:"

echo -ne "\tDOCKER-COMPOSE ... \t\t"
render_template templates/docker-compose.template > build/docker-compose.yml
echo -e "[ \e[0;32m OK \e[0m ]"

#sekcja HAPROXY
echo -e "\tHAPROXY:"

echo -ne "\t  DOCKERFILE ... "
if [ ! -d build/haproxy ]; then
    mkdir -p build/haproxy
fi
#render_template templates/haproxy-dockerfile.template > build/haproxy/Dockerfile
cat templates/haproxy-dockerfile.template > build/haproxy/Dockerfile
echo -e "\t\t[ \e[0;32m OK \e[0m ]"


echo -ne "\t  HAPROXY.CFG ... "
render_template templates/haproxy-cfg.template > build/haproxy/haproxy.cfg
echo -e "\t\t[ \e[0;32m OK \e[0m ]"


echo ""

