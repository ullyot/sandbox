
#!/bin/bash
# This bash script conceived by Michael Ullyot (Augmented Criticism Lab, Department of English, University of Calgary: <acriticismlab.org>) and largely written by Kourosh Banaeianzadeh (LabNext, University of Calgary) on 14 October 2017
# First, clear your Terminal window:
clear
# Create some variables to point, later, at the files to run on:
inputFileName=$1
inputFilePathName="$PWD/$inputFileName"
originalDirectory=$PWD
# Enable pyenv in your Bash shell, so we can run this on Python 2.7:
eval "$(pyenv init -)"
# Then use pyenv to switch the version of Python we're running:
pyenv global 2.7.14
# Just to be safe, confirm that it's the right version:
python --version
# Okay, preliminaries over. Now, move into the coreNLP directory:
cd /Users/ullyot/Sandbox/coreNLP
# Set the 3 lines of properties for coreNLP to follow:
echo "annotators = tokenize, ssplit, pos, lemma" > ullyotProps.properties
echo "outputExtension = .xml" >> ullyotProps.properties
echo "file = $inputFilePathName" >> ullyotProps.properties
# Load the code, libraries, and model jars (whatever that means; see https://stanfordnlp.github.io/CoreNLP/cmdline.html for details):
java -cp "/Users/ullyot/Sandbox/coreNLP/*" -Xmx2g edu.stanford.nlp.pipeline.StanfordCoreNLP -file inputFile
# Run the parser, using ullyotProps.properties:
java -cp "*" -Xmx500m edu.stanford.nlp.pipeline.StanfordCoreNLP -props ullyotProps.properties
# Move coreNLP's output file back to the directory we started in:
mv "$inputFileName.xml" $originalDirectory
# Move into the directory containing Marie Dubremetz's chiasmusDetector, available here <https://github.com/mardub1635/chiasmusDetector/>:
cd /Users/ullyot/Sandbox/chiasmusDetector
# Copy the original text file here:
cp $inputFilePathName .
# Copy the coreNLP's outful file here:
cp "$inputFilePathName.xml" .
# Now, at last, run the Python script:
python MainS.py "$inputFileName.xml" "$inputFileName.chiasmus.xml"
# Then render it more legible with an XSLT transform:
xsltproc annotationDoc.xsl "$inputFileName.chiasmus.xml" > "$inputFileName.xslt"
# Remove the files you just used:
rm $inputFileName
rm "$inputFileName.xml"
# And move the output files to the directory we began with:
mv "$inputFileName.chiasmus.xml" $originalDirectory
mv "$inputFileName.xslt" $originalDirectory
