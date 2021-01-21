#!/usr/bin/env python3
import os
import sys

cwd = os.getcwd()

# os.system(f'cd {cwd} && python -m unittest discover')

# filepath = os.path.join(cwd, 'requirements.py')
# if os.path.isfile(filepath):
#     os.system(f'cd {cwd} && python requirements.py')

os.system('git add .')
os.system(f'git commit --amend --no-edit')
os.system(f'git push -f')
os.system(f'git --no-pager log --oneline --decorate --graph --all -n 12')
