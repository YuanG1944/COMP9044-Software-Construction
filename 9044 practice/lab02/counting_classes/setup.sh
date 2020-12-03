#!/bin/bash
activity=$(basename $(pwd))
./generate_answer_sheet.py >${activity}_answers.txt
test -e autotest/classes.txt || classes.pl >autotest/classes.txt
chmod 644 autotest/classes.txt
ln -sf autotest/classes.txt .
egrep 'class="answer"' index.html >/dev/null || exit
mkdir -m 755 -p solutions
./generate_answer_sheet.py --solutions >solutions/${activity}_answers.txt
chmod 644 solutions/${activity}_answers.txt
ln -sf ../classes.txt solutions/
