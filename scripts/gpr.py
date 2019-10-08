#!/Users/andreaskater/Dev/python python3
import os
import sys
import subprocess
import andi

print('git push')
os.system('git push')

print('git pull-request -c')
os.system('git pull-request -c')

remote = subprocess.check_output(
    'git config --get remote.origin.url'.split(' ')).decode('utf-8')
repo = remote.split(':')[1].split('.')[0]
url = f'https://github.com/{repo}/pulls'
andi.Website(url).open()
