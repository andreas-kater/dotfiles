import os
import pandas as pd
from importlib import import_module
import pkgutil
from pprint import pprint
import sys
import importlib.util

if sys.version_info.major == 3:
    from db.all import *
    basedir = '/Users/andreaskater/Dev/python'
    folders = ['modules', 'services']
    for folder in folders:
        current_folder = os.path.join(basedir, folder)
        for module_loader, module_name, ispkg in pkgutil.iter_modules([current_folder]):
            file_path = os.path.join(module_loader.path, module_name)
            if ispkg:
                file_path = os.path.join(file_path, '__init__.py')
            else:
                file_path += '.py'
            try:
                spec = importlib.util.spec_from_file_location(
                    module_name, file_path)
                modules = importlib.util.module_from_spec(spec)
                spec.loader.exec_module(modules)
                vars()[module_name] = getattr(modules, module_name)
            except:
                print(f'Could not import {module_name}')
