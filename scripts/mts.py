#!/usr/bin/env python3
import os
import sys
import glob
import shutil

downloads_folder = '/Users/andreaskater/Downloads'
secrets_folder = '/Users/andreaskater/secrets'
list_of_files = glob.glob(downloads_folder+'/*')
latest_file = max(list_of_files, key=os.path.getctime)

filename = os.path.split(latest_file)[1]
destination = os.path.join(secrets_folder, filename)
shutil.move(latest_file, destination)
