from pyspark.sql import SparkSession

# 1. Start Spark
spark = SparkSession.builder.appName("WordCountExample").getOrCreate()

# 2. Load data (a text file)
text_file = spark.sparkContext.textFile("sample.txt")

# 3. Split each line into words
words = text_file.flatMap(lambda line: line.split(" "))

# 4. Map each word to (word, 1)
word_pairs = words.map(lambda word: (word, 1))

# 5. Reduce by key (sum counts)
word_counts = word_pairs.reduceByKey(lambda a, b: a + b)

# 6. Show results
for word, count in word_counts.collect():
    print(word, count)
