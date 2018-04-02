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

---

#### Here is how to execute the program ==> ruby script:
```
$ ruby file_hashes.rb /Users/Munukutla/test
```

#### NOTES:
*  for Python3 and Ruby scripts, I have used sha256 for finding the hashing.  We can probably look at other hashing algorithms which might be faster in calculating the hashes for improved speed.
*  For the bash script, just used cksum, we can probably use one of Secure Hash Algorithms (SHA) including SHA1, SHA256 and SHA512
*  For simpler calculations, unix based tools like `diff`, `cmp` can as well be used.

#### More Info on Cryptographic Algorithms:
For Data Integrity validations are done using Message Digest OR Secure Hash Algorithms.


Message Digest - MD5 (128 bit digest) - has vulnerabilities, but can be used to find checksums of a file in a controlled env.
Secure Hash Algoriths: SHA-0, SHA-1, SHA-2, SHA-3
```
SHA-0 and SHA-1 (160 bit hash value or digest)
SHA-2
    SHA-224 (224 bit digest)
    SHA-256 (256 bit digest)
    SHA-384 (384 bit digest)
    SHA-512 (512 bit digest)
    SHA-512/224 (224 bit digest)
    SHA-512/256 (256 bit digest)
SHA-3
    SHA3-224 (224 bit digest)
    SHA3-256 (256 bit digest)
    SHA3-384 (384 bit digest)
    SHA3-512 (512 bit digest)
```
Ref: https://en.wikipedia.org/wiki/SHA-1#Comparison_of_SHA_functions
