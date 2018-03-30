import os
import sys
import hashlib
import pprint


def my_func(input_dir):
    if os.path.isdir(input_dir):
        matches = {}
        for root, dirs, files in os.walk(input_dir):
            for file in files:
                file_ABS_Path = os.path.abspath(os.path.join(root, file))
                if os.path.isfile(file_ABS_Path):
                    with open(file_ABS_Path, 'rb') as f:
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
        values = list(matches.values())
        new_dictionary = {'matches': values}
#        pprint.pprint(matches)
        pprint.pprint(new_dictionary)


if __name__ == "__main__":
    if len(sys.argv) == 2 and os.path.isdir(sys.argv[1]):
        my_func(sys.argv[1])
