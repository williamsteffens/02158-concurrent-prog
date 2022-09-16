import subprocess

for i in range(1, 21): 
    for j in range(1, 21):
        subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                    '-R', 
                    '10',
                    '-W',
                    '5', 
                    '-d',
                    'ass1data/p4/dataP420v20.txt',
                    'shakespeare.txt', 
                    'To be, or not to be, that is the question',
                    f'{j}',
                    f'{i}'])