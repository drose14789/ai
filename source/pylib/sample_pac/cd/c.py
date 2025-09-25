# sample_pac/cd/c.py

import sys
sys.path.append(r'C:\ai\source\pylib')
from sample_pac.ab import a

# python -m sample_pac.cd.c
#from ab import a

def nice():
    print('sample_pac/cd안의 c모듈')
    a.hello()

if __name__ == "__main__" :
    nice()
