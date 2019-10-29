#!/usr/bin/env python3
from PyPDF2 import PdfFileWriter, PdfFileReader
import os
import sys

print(sys.argv)

cwd = os.getcwd()

print(cwd)

output_pdf_file = PdfFileWriter()
output_file_path = os.path.join(cwd, 'merged.pdf')

for input_file in sorted(os.listdir(cwd)):
    if input_file.endswith('.pdf'):
        input_file_path = os.path.join(cwd, input_file)
        input_pdf_file = PdfFileReader(open(input_file_path, "rb"))
        [output_pdf_file.addPage(input_pdf_file.getPage(page_num))
         for page_num in range(input_pdf_file.numPages)]

output_pdf_file.write(open(output_file_path, "wb"))
