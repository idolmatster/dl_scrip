

echo "#****************#"
echo "#ROM LIST CREATOR#"
echo "#****************#"

#******************************#
#Third party francises for roms#
#******************************#
echo "start third party"
#clear commands
>run.sh

echo ">L_classicsG" >> run.sh

#third party classics
tfr="./tfranchise"
  while IFS= read -r tfrname
  do
    tfrname=$(echo $tfrname|tr -d '\r')
    
    line="grep -i \"${tfrname}\" L_all >> L_classicsG"
    
    
    echo "echo \"*-------$tfrname--------*\" >> L_classicsG " >> run.sh
    echo "$line" >> run.sh
    echo "echo \"*------------------------------*\" >> L_classicsG " >> run.sh

done <"$tfr"
echo "done third party"
#run commands
./run.sh

#-------------------#
#SEGA AS THIRD PARTY#
#-------------------#
echo "start sega third party"

#clear commands
>run.sh
#do not clear L_classics

#sega classics
sefranchise="./sfranchise"
  while IFS= read -r sefrname
  do
    sefrname=$(echo $sefrname|tr -d '\r')
    
    line="grep -i \"${sefrname}\" L_all >> L_classicsG"
    
    echo "echo \"*-------$sefrname--------*\" >> L_classicsG " >> run.sh
    echo "$line" >> run.sh
    echo "echo \"*------------------------------*\" >> L_classicsG " >> run.sh

done <"$sefranchise"
echo "done sega third party"

#run commands
./run.sh

#*************#
#NINTENDO ROMS#
#*************#
echo "Nintendo Start"
#clear commands
>run.sh
#Clear Nintendo List

echo ">L_nintendoG" >> run.sh

#nintendo classics
nfr="./nfranchise"
  while IFS= read -r nfrname
  do
    nfrname=$(echo $nfrname|tr -d '\r')
    
    line="grep -i \"${nfrname}\" L_all >> L_nintendoG"
    
    echo "echo \"*-------$nfrname--------*\" >> L_nintendoG " >> run.sh
    echo "$line" >> run.sh
    echo "echo \"*------------------------------*\" >> L_nintendoG " >> run.sh

done <"$nfr"
#run commands
./run.sh

echo "done nintendo"

rm run.sh

echo "europe"
grep "(Europe" L_all > L_europe
grep ",Europe" L_all >> L_europe

echo "western"
grep "(Europe" L_all > L_western
grep "(USA" L_all >> L_western

echo "done"

exit 0;
