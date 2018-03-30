# Find Duplicate files in a directory using Hashing

In a given directory, find all the files which have same content, though different filename, and print a dictionary with matching filename lists.  

The output would look something like below:
```
{'matches': [['new-2.pdf',
              'abc.txt',
              'new-2.good',
              'new-1.txt',
              'bcd.txt',
              'new-2.tx'],
             ['abcd.t', 'good-1.t', 'good-2.t']]}
```


Here is how to execute the program:
```
$ python3 file_hashes.py /Users/Munukutla/test

Where /Users/Munukutla/test is the Directory which has several files with same content, though having a different filename.
```
