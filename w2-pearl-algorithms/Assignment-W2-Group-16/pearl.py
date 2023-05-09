import time


#   2.24 Basic assignment
def make_table(words):
    start = time.process_time()
    words = remove_special_chars(words)
    duration = time.process_time() - start
    print("Time spent removing special characters: " + str(round(duration * 1000000)))

    start = time.process_time()
    words = merge_pairs(words)
    duration = time.process_time() - start
    print("Time spent sorting pairs of words: " + str(round(duration * 1000000)))

    start = time.process_time()
    search_table = combine_sources(words)
    duration = time.process_time() - start
    print("Time spent combining sources: " + str(round(duration * 1000000)))

    return search_table


#   2.25 (a) Bonus assignments
def make_counted_table(words):
    start = time.process_time()
    words = remove_special_chars(words)
    duration = time.process_time() - start
    print("Time spent removing special characters: " + str(round(duration * 1000000)))

    start = time.process_time()
    words = merge_pairs(words)
    duration = time.process_time() - start
    print("Time spent sorting pairs of words: " + str(round(duration * 1000000)))

    start = time.process_time()
    search_table = combine_counted_sources(words)
    duration = time.process_time() - start
    print("Time spent combining sources with occurrences: " + str(round(duration * 1000000)))

    return search_table


#   2.25 (b) Bonus assignments
def make_density_table(words):
    start = time.process_time()
    words = remove_special_chars(words)
    duration = time.process_time() - start
    print("Time spent removing special characters: " + str(round(duration * 1000000)))

    start = time.process_time()
    words = merge_pairs(words)
    duration = time.process_time() - start
    print("Time spent sorting pairs of words: " + str(round(duration * 1000000)))

    start = time.process_time()
    sources = get_sources(words)
    duration = time.process_time() - start
    print("Time spent storing sources with word count: " + str(round(duration * 1000000)))

    start = time.process_time()
    search_table = combine_sources_with_density(words, sources)
    duration = time.process_time() - start
    print("Time spent combining sources with density: " + str(round(duration * 1000000)))

    return search_table


def remove_special_chars(words):
    special_chars = ['~', ':', '+', '[', '\\', '@', '^', '{', '%', '(', '"', '*', '|', ',', '&', '<', '`', '}', '.',
                     '_', '=', ']', '!', '>', ';', '?', '#', '$', ')', '/', '\'', '\"', '”', '“']

    result = []

    for word in words:
        val = word[0]
        for char in special_chars:
            if char in val:
                val = val.replace(char, '')

        if val != '':
            result.append([val, word[1]])

    return result


def combine_sources(words):
    if len(words) == 0:
        return -1

    #   Add the first word
    fst_word_val = words[0][0]
    fst_word = [fst_word_val, [words[0][1]]]

    search_table = [fst_word]

    #   Combine sources in words
    last_word_i = 0
    last_source_i = 0
    for i in range(len(words) - 1):
        curr_word = words[i]
        next_word = words[i + 1]

        #   Add a new word to the search table
        if curr_word[0] != next_word[0] and next_word[0] != 0:
            search_table.append([next_word[0], [next_word[1]]])
            last_source_i = 0
            last_word_i += 1

        #   Add a new source where the word was found
        elif search_table[last_word_i][1][last_source_i] != next_word[1]:
            search_table[last_word_i][1].append(next_word[1])
            last_source_i += 1

    return search_table


def combine_counted_sources(words):
    if len(words) == 0:
        return -1

    #   Add the first word
    fst_word = [words[0][0], [[words[0][1], 1]]]
    search_table = [fst_word]

    #   Combine word sources with occurrences
    last_word_i = 0
    last_source_i = 0
    for i in range(len(words) - 1):
        curr_word = words[i]
        next_word = words[i + 1]
        word_sources = search_table[last_word_i][1]

        #   Add a new word to the search table
        if curr_word[0] != next_word[0]:
            search_table.append([next_word[0], [[next_word[1], 1]]])

            #   Sort word occurrences in decreasing order
            search_table[last_word_i][1] = inverse_bubble_by_val(search_table[last_word_i][1])

            last_source_i = 0
            last_word_i += 1

        #   Add a new source where the word was found
        elif word_sources[last_source_i][0] != next_word[1]:
            word_sources.append([next_word[1], 1])
            last_source_i += 1

        #   Increase the number of occurrences in the last source
        else:
            word_sources[last_source_i][1] += 1

    #   Sort the last word occurrences in decreasing order
    search_table[last_word_i][1] = inverse_bubble_by_val(search_table[last_word_i][1])

    return search_table


def combine_sources_with_density(words, sources):
    if len(words) == 0:
        return -1

    #   Add the first word
    fst_word = [words[0][0], [[words[0][1], 1]]]
    search_table = [fst_word]

    if len(words) == 1:
        return search_table

    #   Combine word sources with densities
    last_word_i = 0
    last_source_i = 0
    for i in range(len(words) - 1):
        curr_word = words[i]
        next_word = words[i + 1]
        word_sources = search_table[last_word_i][1]

        #   Add a new word to the search table
        if curr_word[0] != next_word[0]:
            search_table.append([next_word[0], [[next_word[1], 1]]])

            last_source_i = 0
            last_word_i += 1

        #   Add a new source where the word was found
        elif word_sources[last_source_i][0] != next_word[1]:
            word_sources.append([next_word[1], 1])
            last_source_i += 1

        #   Increase the number of occurrences in the last source
        else:
            word_sources[last_source_i][1] += 1

    #   Count sources' density
    search_table = count_density(sources, search_table)

    return search_table


#   Returns the pair list with densities
def count_density(sources, search_table):
    for word in search_table:
        word_sources = word[1]
        for word_source in word_sources:
            source = search_pair(sources, word_source[0])
            if source != -1:
                word_source[1] = float("{0:.8f}".format(word_source[1] / source[1]))

        #   Sort the word densities in decreasing order
        word[1] = inverse_bubble_by_val(word[1])

    return search_table


#   Returns the source list with word count
def get_sources(words):
    sources = []

    for word in words:
        found = False

        for source in sources:
            if source[0] == word[1]:
                source[1] += 1
                found = True

        if not found:
            sources.append([word[1], 1])

    return sources


#   Inverse bubble sorting by the second value in pairs
def inverse_bubble_by_val(pairs):
    last_swap_i = len(pairs) - 1

    while last_swap_i > 0:
        curr_swap_i = 0
        i = 0

        while i < last_swap_i:
            if pairs[i][1] < pairs[i + 1][1]:
                pairs[i], pairs[i + 1] = pairs[i + 1], pairs[i]
                curr_swap_i = i
            i += 1
        last_swap_i = curr_swap_i

    return pairs


#   Merge sorting applicable to pairs
def merge_pairs(data):
    if len(data) == 0 or len(data) == 1:
        return data
    else:
        i = len(data) // 2
        fst = merge_pairs(data[:i])
        snd = merge_pairs(data[i:])
        res = []
        fi = 0
        si = 0

        while fi < len(fst) and si < len(snd):
            if fst[fi][0] < snd[si][0] or (fst[fi][0] == snd[si][0] and fst[fi][1] < snd[si][1]):
                res.append(fst[fi])
                fi += 1
            else:
                res.append(snd[si])
                si += 1

        if fi <= len(fst) - 1:
            res.extend(fst[fi:])
        elif si <= len(snd) - 1:
            res.extend(snd[si:])

        return res


#   Linear search for pairs
def search_pair(data, value):
    for el in data:
        if el[0] == value:
            return el
    return -1
