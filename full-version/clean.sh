echo ""
echo "WYCZYŚCIĆ KONFIGURACJĘ ?"
select y in "TAK" "NIE" ; do
    case $y in
        "TAK") break; ;;
        "NIE") exit ;;
        *) echo "Nic nie wybrałeś"
    esac
done
echo ""

rm -rf build/
rm -rf config.cfg

echo "WYCZYSZCZONO"