from setuptools import setup
from torch.utils.cpp_extension import CppExtension, BuildExtension, CUDAExtension
# pylint: skip-file

from distutils.command.build import build
from setuptools.command.install import install

from setuptools.command.develop import develop

import os
import subprocess
import platform
BASEPATH = os.path.dirname(os.path.abspath(__file__))


class custom_develop(develop):
    def run(self):
        original_cwd = os.getcwd()

        folders = [
            os.path.join(BASEPATH, 'bigg/model/tree_clib'),
        ]
        for folder in folders:
            os.chdir(folder)
            subprocess.check_call(['make'])

        os.chdir(original_cwd)

        super().run()


setup(name='bigg',
    py_modules=['bigg'],
    install_requires=[
        'torch',
    ],
    cmdclass={
        'develop': custom_develop,
    }
)