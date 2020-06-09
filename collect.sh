mkdir -p build/classes
mkdir -p build/classes

cd mi-UGens

# TODO: There is an error in MiBraids at the moment.
FOLDERS=(MiClouds MiElements MiMu MiPlaits MiRings MiVerb)

# Collect shared object files.
for FOLDER in "${FOLDERS[@]}"
do
		cd $FOLDER/build
		echo "Collecting $FOLDER"
		mkdir -p ../../../build/classes/$FOLDER
		cp $FOLDER.so ../../../build/classes/$FOLDER
		cd ../..
done

cd ..

pwd

# Collect .sc files.
for FOLDER in "${FOLDERS[@]}"
do
		cp mi-UGens/sc/Classes/$FOLDER.sc build/classes/$FOLDER/
done
		
cp -r mi-UGens/sc/HelpSource/ build/
