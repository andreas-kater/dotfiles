import os
import numpy as np
import pandas as pd
from importlib import import_module
import pkgutil
from pprint import pprint
import sys
import importlib.util

if sys.version_info.major == 3:
    from db.models import *
    basedir = '/Users/andreaskater/Dev/python'
    folders = ['models', 'modules', 'services']
    packages = []
    for folder in folders:
        current_folder = os.path.join(basedir, folder)
        for module_loader, name, ispkg in pkgutil.iter_modules([current_folder]):
            packages.append(
                os.path.join(basedir, folder, name + '.py')
            )
    for file_path in packages:
        file_name = os.path.split(file_path)[1]
        module_name = os.path.splitext(file_name)[0]
        try:
            spec = importlib.util.spec_from_file_location(
                module_name, file_path)
            modules = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(modules)
            vars()[module_name] = getattr(modules, module_name)
        except:
            print(f'Could not import {module_name}')
