import subprocess

for i in range(1, 21): 
    subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                '-R', 
                '10', 
                '-W',
                '4',
                '-d',
                './ass1data/p3/dataT1-20-100.csv',
                'shakespeare.txt', 
                'To be, or not to be, that is the question',
                f'{i}',
                '>>',
                './ass1data/p3/programOutputT1-20-100.txt'], shell=True)

for i in range(25, 101, 5): 
    subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                '-R', 
                '10', 
                '-W',
                '4',
                '-d',
                './ass1data/p3/dataT1-20-100.csv',
                'shakespeare.txt', 
                'To be, or not to be, that is the question',
                f'{i}',
                '>>',
                './ass1data/p3/programOutputT1-20-100.txt'], shell=True)
