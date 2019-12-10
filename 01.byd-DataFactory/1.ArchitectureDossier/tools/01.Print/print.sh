now="$( date +"%Y%m%d_%H%M%S" )"
directory="../../"
printdirectory="./tools/01.Print/"
templatedirectory="./tools/01.Print/template"
exportdirectory="./tools/01.Print/exporteddoc/"


echo '===================================================='
echo ' Lancement du processus'
echo ' Fichier : '$1

cd $directory

pandoc $1  --reference-doc=$templatedirectory/Sixensetemplate.dotx -o $exportdirectory$now.ArchitectureDossier$1.docx



echo '----------------------------------------------------'
echo 'Processus terminé.'
echo 'Fichier créé: ' $exportdirectory$now.ArchitectureDossier$1.docx
echo '===================================================='
