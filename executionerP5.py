import subprocess

# P3 igen
# with open('./ass1data/p5/programOutputP5T1-20-100500.txt', 'a') as f:
#     for i in range(1, 21): 
#         subprocess.call(['java', '-cp', './src/', 'ass1/Search', 
#                 '-R', 
#                 '10', 
#                 '-W',
#                 '4',
#                 '-d',
#                 './ass1data/p5/dataP5T1-20-100500.csv',
#                 'shakespeare.txt', 
#                 'To be, or not to be, that is the question',
#                 '{0}'.format(i)], 
#                 stdout=f, 
#                 universal_newlines=True)

#     for i in range(25, 101, 5): 
#         subprocess.call(['java', '-cp', './src/', 'ass1/Search', 
#                 '-R', 
#                 '10', 
#                 '-W',
#                 '4',
#                 '-d',
#                 './ass1data/p5/dataP5T1-20-100500.csv',
#                 'shakespeare.txt', 
#                 'To be, or not to be, that is the question',
#                 '{0}'.format(i)], 
#                 stdout=f, 
#                 universal_newlines=True)



# P4 igen
with open('./ass1data/p5/programOutputP5TH1-20T1-20-100.txt', 'w') as f:
    for i in range(1, 21): 
        for j in range(1, 21): 
            subprocess.call(['java', '-cp', './src/', 'ass1.Search', 
                        '-R', 
                        '10', 
                        '-W',
                        '4',
                        '-d',
                        './ass1data/p5/dataP5TH1-20T1-20-100500.csv',
                        'shakespeare.txt', 
                        'To be, or not to be, that is the question',
                        '{0}'.format(j),
                        '{0}'.format(i)],
                        stdout=f,
                        universal_newlines=True)

        for j in range(25, 101, 5): 
            subprocess.call(['java', '-cp', './src/', 'ass1.Search', 
                        '-R', 
                        '10', 
                        '-W',
                        '4',
                        '-d',
                        './ass1data/p5/dataP5TH1-20T1-20-100500.csv',
                        'shakespeare.txt', 
                        'To be, or not to be, that is the question',
                        '{0}'.format(j),
                        '{0}'.format(i)],
                        stdout=f,
                        universal_newlines=True)

        for j in range(150, 501, 50): 
            subprocess.call(['java', '-cp', './src/', 'ass1.Search', 
                        '-R', 
                        '10', 
                        '-W',
                        '4',
                        '-d',
                        './ass1data/p5/dataP5TH1-20T1-20-100500.csv',
                        'shakespeare.txt', 
                        'To be, or not to be, that is the question',
                        '{0}'.format(j),
                        '{0}'.format(i)],
                        stdout=f,
                        universal_newlines=True)