import os
import numpy as np
import pandas as pd
from importlib import import_module


def dynamic_import(class_name):
    module_object = import_module(class_name)
    target_class = getattr(module_object, class_name)

    return target_class


packages = []
for r, d, files in os.walk('/Users/andreaskater/Dev/python'):
    if 'venv' not in r:
        for file in files:
            filename, ext = os.path.splitext(file)
            if ext == '.py' and filename[0].isupper():
                packages.append(filename)


for package in packages:
    vars()[package] = dynamic_import(package)
    print(f'Imported {package}')
