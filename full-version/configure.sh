clear
echo ""
echo "SKRYPT KONFIGURUJACY ZADANIE"
echo ""



echo ""
echo "PODAJ WERSJE WILDFLY JAKIEJ CHCESZ UZYWAC"
select version in "latest" "10.1.0.Final" "9.0.2.Final" "8.2.1.Final" "Dockerfile" ; do
    echo -e "WILDFLY VERSION: \033[32;44m $version \e[0m"
    wf_version=$version
    break;
done
echo ""

echo ""
echo "PODAJ WERSJE HAPROXY JAKIEJ CHCESZ UZYWAC"
select version in "latest" "1.5" "1.6" ; do
    echo -e  "HAPROXY VERSION: \033[32;44m $version \e[0m"
    ha_version=$version
    break;
done
echo ""



echo ""
echo "PODSUMOWANIE:"
echo -e "WILDFLY VERSION: \033[32;44m $wf_version \e[0m"
echo -e "HAPROXY VERSION: \033[32;44m $ha_version \e[0m"


echo ""
echo "DZIĘKI"
echo -e "\e[0m"