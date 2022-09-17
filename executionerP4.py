import subprocess

for i in range(1, 21): 
    for j in range(1, 21): 
        subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                    '-R', 
                    '10', 
                    '-W',
                    '4',
                    '-d',
                    './ass1data/p4/dataTH1-20T1-20-100.csv',
                    'shakespeare.txt', 
                    'To be, or not to be, that is the question',
                    f'{j}',
                    f'{i}',
                    '>>',
                    './ass1data/p4/programOutputTH1-20T1-20-100.txt'], shell=True)

    for j in range(25, 101, 5): 
        subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                    '-R', 
                    '10', 
                    '-W',
                    '4',
                    '-d',
                    './ass1data/p4/dataTH1-20T1-20-100.csv',
                    'shakespeare.txt', 
                    'To be, or not to be, that is the question',
                    f'{j}',
                    f'{i}',
                    '>>',
                    './ass1data/p4/programOutputTH1-20T1-20-100.txt'], shell=True)