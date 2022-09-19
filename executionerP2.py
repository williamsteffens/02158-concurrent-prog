import subprocess

# xtest
# for i in range(1, 21): 
#     subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
#                 '-R', 
#                 '10', 
#                 '-W',
#                 '4',
#                 'xtest.txt', 
#                 'xxxx',
#                 f'{i}',
#                 '>>',
#                 './ass1data/p2/xtestT1-20.txt'], shell=True)

# single executor speedup
with open('./ass1data/p2/programOutputT1-20NEW.txt','a') as f: 
    for i in range(1, 21): 
        subprocess.run(['java', '-cp', './out/production/JavaConcurrentProg', 'ass1.Search', 
                    '-R', 
                    '10', 
                    '-W',
                    '4',
                    '-d',
                    './ass1data/p2/dataT1-20.csv',
                    'shakespeare.txt', 
                    'To be, or not to be, that is the question',
                    f'{i}'],
                    stdout=f,
                    text=True)