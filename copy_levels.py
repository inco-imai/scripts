#!/usr/bin/python3

import tkinter
from tkinter import filedialog
import os
import shutil
import glob

"""
This script copies *.tlv files in a selected directory to the current directory.

<USAGE>
Open a terminal of Ubuntu of WSL2.
Go to a directory where old *.tlv files and the current .tnz file exist.
Then execute this file as below:
$ /path/to/copy_levels.py
A window will popup.
Select a directory where new *.tlv files exist by double-clicking it, press ok and a replacement will happen.
Go to your OpenToonz window and do File>Revert Scene.

This script uses tk so install it.
"""

targetdir='./'

tmpdir = '../'
selected_path = tkinter.filedialog.askdirectory(initialdir = tmpdir, mustexist = True, title = 'choose a directory')
if not selected_path :
  print('choose a directory\n')
  exit()

print('selected '+selected_path)
if os.path.samefile(selected_path, tmpdir) :
  print('do not choose the current directory\n')
  exit()

for file in glob.glob(selected_path+'/*.tlv', recursive=False):
  if os.path.isfile(file):
    shutil.copy2(file, targetdir)

print('copied\n')

