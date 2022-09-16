import subprocess

for i in range(1, 21): 
    subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                '-R', 
                '10', 
                '-W',
                '5',
                '-d',
                'ass1data/p3/dataP320.txt',
                'shakespeare.txt', 
                'To be, or not to be, that is the question',
                f'{i}'])

for i in range(25, 101, 5): 
    subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                '-R', 
                '10',
                '-W',
                '5', 
                '-d',
                'ass1data/p3/dataP3100.txt',
                'shakespeare.txt', 
                'To be, or not to be, that is the question',
                f'{i}'])
