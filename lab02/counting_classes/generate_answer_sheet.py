#!/usr/bin/python3

import re, sys, html

print_answers = not not sys.argv[1:]

print("""
This file is automarked.

Do not add extra lines to this file, just add your answers.

For example if your answer to Q1 is: egrep Andrew words.txt
Change the line that says Q1 answer to:

Q1 answer: egrep Andrew words.txt
""")


question_number = 0
question = ""
answer = ""
tag_seen = False
for line in open("index.html"):
    line = line.strip()
    if line.startswith("<li>") or  line.startswith("</ol>") :
        if question_number:
            print("\n{}) {}".format(question_number, question))
            if print_answers:
                print("Q{} answer: {}".format(question_number, html.unescape(answer)))
            else:
                print("Q{} answer:".format(question_number))
            print()
        question_number += 1
        question = ""
        answer = ""
        tag_seen = False
    elif line.startswith('<pre>') and not answer:
        answer = re.sub(r'<.*?>', '', line)
        answer = re.sub(r'\\(.)', r'\1', answer)
    elif line.startswith("<"):
        tag_seen = True
    elif not tag_seen and line and not line.startswith('For example'):
        question += html.unescape(re.sub(r'<.*?>', '', line)) + "\n"
if print_answers:
    print("Q{} answer: {}".format(question_number, html.unescape(answer)))
