import pearl

test_list = [['dead', 'grail.txt'], ['dead', 'grail.txt'], ['dead', 'brian.txt'],
             ['eunt', 'brian.txt'], ['eunt', 'brian.txt'], ['spank', 'grail.txt'], ['spank', 'grail.txt'],
             ['spank', 'grail.txt'], ['spank', 'grail.txt'], ['spank', 'grail.txt'], ['spank', 'grail.txt'],
             ['spank', 'grail.txt'], ['dead', 'grail.txt']]

print("\nInput: " + str(test_list) + '\n')

print("1. Basic Assignment - Make Table:\n")
print("\nOutput: " + str(pearl.make_table(test_list)) + '\n\n')

print("2. Bonus Assignment (a) - Make Counted Table:\n")
print("\nOutput: " + str(pearl.make_counted_table(test_list)) + '\n\n')

print("3. Bonus Assignment (b) - Make Density Table:\n")
print("\nOutput: " + str(pearl.make_density_table(test_list)) + '\n')
