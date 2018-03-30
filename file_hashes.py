import os
import sys
import hashlib
import pprint


def my_func(input_dir):
    if os.path.isdir(input_dir):
        matches = {}
        for file in os.listdir(input_dir):
            if os.path.isfile(file):
                with open(file, 'rb') as f:
                    file_sha256 = str(hashlib.sha256(f.read()).hexdigest())
                    if file_sha256 in matches:
                        if matches.get(str(file_sha256)) is not None:
                            my_list = list(matches.get(str(file_sha256)))
                            my_list.append(str(file))
                            matches[file_sha256] = my_list
                    else:
                        new_list = list()
                        new_list.append(str(file))
                        matches.setdefault(file_sha256, new_list)
        pprint.pprint(matches)


if __name__ == "__main__":
    if len(sys.argv) == 2 and os.path.isdir(sys.argv[1]):
        my_func(sys.argv[1])
#    if len(sys.argv) == 2 and os.path.isdir(sys.argv[1]):
#        matches = {}
#        print(os.listdir(sys.argv[1]))
#        for file in os.listdir(sys.argv[1]):
#            if os.path.isfile(file):
#                with open(file, 'rb') as f:
#                    file_sha256 = str(hashlib.sha256(f.read()).hexdigest())
#                    if file_sha256 in matches:
#                        if matches.get(str(file_sha256)) is not None:
#                            my_list = list(matches.get(str(file_sha256)))
#                            my_list.append(str(file))
#                            matches[file_sha256] = my_list
#                    else:
#                        new_list = list()
#                        new_list.append(str(file))
#                        matches.setdefault(file_sha256, new_list)
#        pprint.pprint(matches)
