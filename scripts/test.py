import unittest
import os

cwd = os.getcwd()
loader = unittest.TestLoader()
suite = loader.discover(cwd)

runner = unittest.TextTestRunner()
runner.run(suite)
