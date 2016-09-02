render_template() {
  eval "echo \"$(cat $1)\""
}

clear
echo ""
echo "SKRYPT KONFIGURUJACY ZADANIE"
echo ""


echo ""
echo "PODAJ WERSJE WILDFLY JAKIEJ CHCESZ UZYWAC"
select version in "latest" "10.1.0.Final" "9.0.2.Final" "8.2.1.Final" "Dockerfile" ; do
    echo -e "WILDFLY VERSION: \033[37;44m $version \e[0m"
    WF_VERSION=$version
    break;
done
echo ""

echo ""
echo "PODAJ WERSJE HAPROXY JAKIEJ CHCESZ UZYWAC"
select version in "latest" "1.5" "1.6" ; do
    echo -e  "HAPROXY VERSION: \033[37;44m $version \e[0m"
    HA_VERSION=$version
    break;
done
echo ""


echo ""
echo "PODSUMOWANIE:"
echo -e "WILDFLY VERSION: \033[37;44m $WF_VERSION \e[0m"
echo -e "HAPROXY VERSION: \033[37;44m $HA_VERSION \e[0m"

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
echo -e "\e[0m"

render_template templates/config.template > config.cfg 
