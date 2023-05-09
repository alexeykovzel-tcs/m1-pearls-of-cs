from labfiles import util
import time
import pearl


# read in text files
start = time.process_time()
word_pairs = util.all_word_pairs()
duration = time.process_time() - start
print("Time spent reading text files: {}".format(round(duration * 1000000)))

# create search table
start = time.process_time()
word_table = pearl.make_counted_table(word_pairs)
duration = time.process_time() - start

# print('\n')
# for i in word_table:
#     print(i)
# print('\n')

print("Total time spent creating search table: {}".format(round(duration * 1000000)))
