Documentation for chiasmusScript.bash and chiasmusMultiple.bash

These two .bash scripts were largely written by Kourosh Banaeianzadeh (LabNext, University of Calgary), at the direction of Michael Ullyot (Augmented Criticism Lab, Department of English, University of Calgary: <acriticismlab.org>), on 14 October 2017.

Before you run either script, you need to download Stanford University's coreNLP <https://stanfordnlp.github.io/CoreNLP/>; put it in a directory called coreNLP. Then download Marie Dubremetz's chiasmusDetector, available here <https://github.com/mardub1635/chiasmusDetector/>; put that in a directory called chiasmusDetector.

You will also need to change the paths in chiasmusScript.bash on lines 17, 23, and 29; replace /Users/ullyot/Sandbox/ with the path to your own directories.

Put both chiasmusScript.bash and chiasmusMultiple.bash in a directory, with coreNLP and chiasmusDetector as children of that parent. Put your .txt files, also, in the parent directory. 

Finally, you're ready to issue commands: 

1 / If you have just one text file to analyze, enter this:

sh chiasmusScript.bash fileName.txt

2 / If you have multiple text files to analyze, this will do it:

sh chiasmusMultiple.bash









