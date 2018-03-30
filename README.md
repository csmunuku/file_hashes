# Find Duplicate files in a directory using Hashing

In a given directory, find all the files which have same content, though different filename, and print a json/dictionary with matching filename lists.  

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


#### Here is how to execute the program ==> using Python3:
```
$ python3 file_hashes.py /Users/Munukutla/test

Where /Users/Munukutla/test is the Directory which has several files with same content,
though having a different filename.
```

---

#### Here is how to execute the program ==> bash script:
```
$ ./same_files.sh /Users/Munukutla/test
```

#### NOTES:
*  for Python3 script, I have used sha256 for finding the hashing.  We can probably look at other hashing algorithms which might be faster in calculating the hashes for improved speed.
*  For the bash script, just used cksum, we can probably use one of Secure Hash Algorithms (SHA) including SHA1, SHA256 and SHA512
