now="$( date +"%Y%m%d_%H%M%S" )"
directory="../../"
printdirectory="./tools/01.Print/"
templatedirectory="./tools/01.Print/template"
exportdirectory="/Users/SWilbert/Documents/DossierArchitectureSixense"


echo '===================================================='
echo ' Lancement du processus'
for f in $directory*.md
do
  cat $f >>$now.allpages.md
  echo '<div style="page-break-after: always;"></div>' >>$now.allpages.md
  echo ' ' >>$now.allpages.md
 # do something on $f
done
mv $now.allpages.md $directory$now.allpages.md

cd $directory

pandoc $now.allpages.md  --reference-doc=$templatedirectory/Sixensetemplate.dotx -o $exportdirectory$now.ArchitectureDossier.docx

rm $now.allpages.md
echo '----------------------------------------------------'
echo 'Processus terminé.'
echo 'Fichier créé: ' $exportdirectory$now.ArchitectureDossier.docx
echo '===================================================='
