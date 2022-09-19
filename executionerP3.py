import subprocess

with open('./ass1data/p3/programOutputT1-20-100-500.txt','a') as f: 
    for i in range(1, 21): 
        subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                    '-R', 
                    '10', 
                    '-W',
                    '4',
                    '-d',
                    './ass1data/p3/dataT1-20-100-500.csv',
                    'shakespeare.txt', 
                    'To be, or not to be, that is the question',
                    f'{i}'],
                    stdout=f,
                    text=True)

    for i in range(30, 101, 10): 
        subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                    '-R', 
                    '10', 
                    '-W',
                    '4',
                    '-d',
                    './ass1data/p3/dataT1-20-100-500.csv',
                    'shakespeare.txt', 
                    'To be, or not to be, that is the question',
                    f'{i}'],
                    stdout=f,
                    text=True)

    for i in range(150, 501, 50): 
        subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                    '-R', 
                    '10', 
                    '-W',
                    '4',
                    '-d',
                    './ass1data/p3/dataT1-20-100-500.csv',
                    'shakespeare.txt', 
                    'To be, or not to be, that is the question',
                    f'{i}'],
                    stdout=f,
                    text=True)