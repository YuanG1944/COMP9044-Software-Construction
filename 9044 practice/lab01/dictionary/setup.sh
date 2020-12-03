#!/bin/bash
activity=$(basename $(pwd))
./generate_answer_sheet.py >${activity}_answers.txt
egrep 'class="answer"' index.html >/dev/null || exit
mkdir -m 755 -p solutions
./generate_answer_sheet.py --solutions >solutions/${activity}_answers.txt
chmod 644 solutions/${activity}_answers.txt
