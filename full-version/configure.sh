render_template() {
  eval "echo \"$(cat $1)\""
}

clear
echo ""
echo "SKRYPT KONFIGURUJACY ZADANIE"
echo ""

echo ""
echo "PODAJ METODĘ BUDOWANIA WILDFLYA"
select method in "IMAGE" "DOCKERFILE" ; do
    echo -e "METODA: \e[0;32m $method \e[0m"
    WF_BUILD_METHOD=$method
    break;
done
echo ""

echo ""
echo "PODAJ WERSJE WILDFLY JAKIEJ CHCESZ UZYWAC"
select version in "latest" "10.1.0.Final" "9.0.2.Final" "8.2.1.Final" ; do
    echo -e "WERSJA WILDFLY: \e[0;32m $version \e[0m"
    WF_VERSION=$version
    break;
done
echo ""

echo ""
echo "PODAJ WERSJE HAPROXY JAKIEJ CHCESZ UZYWAC"
select version in "latest" "1.5" "1.6" ; do
    echo -e  "WERSJA HAPROXY: \e[0;32m $version \e[0m"
    HA_VERSION=$version
    break;
done
echo ""

echo ""
echo "CZY HAPROXY MA UŻYWAĆ SSL-a ?"
select yn in "TAK" "NIE" ; do
    echo -e  "HAPROXY SSL \e[0;32m $yn \e[0m"
    HA_SSL=$yn
    break;
done
echo ""


echo ""
echo "PODSUMOWANIE:"
echo "WILDFLY:"
echo -e "  METODA: \e[0;32m $WF_BUILD_METHOD \e[0m"
echo -e "  WERSJA: \e[0;32m $WF_VERSION \e[0m"
echo "HAPROXY"
echo -e "  WERSJA: \e[0;32m $HA_VERSION \e[0m"
echo -e "  SSL:    \e[0;32m $HA_SSL \e[0m"
echo ""
echo "ZAPISAĆ USTAWIENIA ?"
select y in "TAK" "NIE" ; do
    case $y in
        "TAK") break; ;;
        "NIE") exit ;;
        *) echo "Nic nie wybrałeś"
    esac
done
echo ""

echo ""
echo "ZAPISANO"
echo "ABY ZBUDOWAĆ KONFIGURACJĘ URUCHOM MAKE.SH"
echo -e "\e[0m"

render_template templates/config.template > config.cfg
