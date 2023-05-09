The assignment was done by:
Aliaksei Kouzel - 2648563
Hanna Gardebroek - 2800012

What was done:
The pearl.py module includes the basic 2.24 assignment + both bonus 2.25 assignment extensions:

Extensions for 2.25:
2.25(a) is performed by calling the function "make_counted_table(words)", which extends 2.24 by counting the number of
times the word was mentioned in a source. After that, the value is stored as the second element with a source name.
Also, the function sorts word occurrences in decreasing order using "inverse_bubble_by_val()" algorithm.

2.25(b) is performed by calling the function "make_density_table(words)", which extends 2.25(a) by calling the function
"get_sources(words)" to get the total word count in each source. At the end of an algorithm, the function
"count_density(sources, search_table)" is called which divides the word count of each source of each word by the total
 word count in a corresponding source, thereby counting word density.

Testing:
The file includes test_script.sh calling test.py module.

We used the following commands to make our solution work:

pearl.make_table(test_list)
pearl.make_counted_table(test_list)
pearl.make_density_table(test_list)

Testing output:

----------------------------------------------------------

Input: [['dead', 'grail.txt'], ['dead', 'grail.txt'], ['dead', 'grail.txt'], ['dead', 'brian.txt'],
['eunt', 'brian.txt'], ['eunt', 'brian.txt'], ['spank', 'grail.txt'], ['spank', 'grail.txt'], ['spank', 'grail.txt'],
 ['spank', 'grail.txt'], ['spank', 'grail.txt'], ['spank', 'grail.txt'], ['spank', 'grail.txt']]

1. Basic Assignment - Make Table:

Time spent removing special characters: 45
Time spent sorting pairs of words: 72
Time spent combining sources: 17

Output: [['dead', ['brian.txt', 'grail.txt']], ['eunt', ['brian.txt']], ['spank', ['grail.txt']]]


2. Bonus Assignment (a) - Make Counted Table:

Time spent removing special characters: 36
Time spent sorting pairs of words: 81
Time spent combining sources with occurrences: 32

Output: [['dead', [['grail.txt', 3], ['brian.txt', 1]]], ['eunt', [['brian.txt', 2]]], ['spank', [['grail.txt', 7]]]]


3. Bonus Assignment (b) - Make Density Table:

Time spent removing special characters: 45
Time spent sorting pairs of words: 81
Time spent storing sources with word count: 12
Time spent combining sources with density: 79

Output: [['dead', [['brian.txt', 0.33333333], ['grail.txt', 0.3]]], ['eunt', [['brian.txt', 0.66666667]]],
 ['spank', [['grail.txt', 0.7]]]]

----------------------------------------------------------