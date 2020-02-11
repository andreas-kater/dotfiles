#!/usr/bin/env python3
import os
import glob
import shutil

cwd = os.getcwd()
downloads_folder = '/Users/andreaskater/Downloads'
list_of_files = glob.glob(downloads_folder+'/*')
latest_file = max(list_of_files, key=os.path.getctime)
print('\n'+latest_file+'\n')

original_filename = os.path.split(latest_file)[1]
new_filename = input('Enter new filename: ') or original_filename
destination = os.path.join(cwd, new_filename)
shutil.move(latest_file, destination)

os.system("echo '%s' | pbcopy" % new_filename)
