echo "Nom du ou des texture a creer"
read -r fichiers
cdmaterial=$(echo "$1" | sed 's|.*materials/||')
if [[ -n "$fichiers" ]]; then
	for nom_fichier in $fichiers; do
		file=$nom_fichier".vmt"
		touch $file
		cat vmt.model > $file
		sed -i "s|mat_dir|$cdmaterial|g" $file
		sed -i "s|untitled_body|$nom_fichier|g" $file
		echo "Le fichier \"$nom_fichier\" a été créé."

		mv "$nom_fichier.vmt" "$1"
	done
else
	echo "aucun nom de fichier saisi"
fi
