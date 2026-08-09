#!/usr/bin/python3

text = "   I love data analysis   "

print("Before strip: ", len(text))

# LTRIM in SQL = lstrip() in python

lstrip_text = text.lstrip()

print("LTRIM(lstrip): ", lstrip_text)

print("After strip: ", len(lstrip_text))

rstrip_text = text.rstrip()

print("After rstrip: ", len(rstrip_text))

strip_text = text.strip()

print("After strip: ", len(strip_text))
