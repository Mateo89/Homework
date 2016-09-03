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
./templates/docker-compose.template > build/docker-compose.yml
#render_template templates/docker-compose.template > build/docker-compose.yml
echo -e "[ \e[0;32m OK \e[0m ]"

#sekcja HAPROXY
echo -e "\tHAPROXY:"

echo -ne "\t  DOCKERFILE ... "
if [ ! -d build/haproxy ]; then
    mkdir -p build/haproxy
fi
./templates/haproxy-dockerfile.template > build/haproxy/Dockerfile
echo -e "\t\t[ \e[0;32m OK \e[0m ]"


echo -ne "\t  HAPROXY.CFG ... "
./templates/haproxy-cfg.template > build/haproxy/haproxy.cfg
echo -e "\t\t[ \e[0;32m OK \e[0m ]"

if [ $HA_SSL == "TAK" ]; then
echo -ne "\t  CERT.PEM ...   "
cat templates/haproxy-cert.template > build/haproxy/cert.pem
echo -e "\t\t[ \e[0;32m OK \e[0m ]"
fi

echo ""

#sekcja WILDFLY

if [ $WF_BUILD_METHOD == "DOCKERFILE" ]; then

    echo -e "\tWILDFLY:"

    if [ ! -d build/wildfly  ]; then
        mkdir -p build/wildfly
    fi

    echo -ne "\t  DOCKERFILE ... "
    render_template templates/wf-dockerfile.template > build/wildfly/Dockerfile
    echo -e "\t\t[ \e[0;32m OK \e[0m ]"

    echo ""

fi


