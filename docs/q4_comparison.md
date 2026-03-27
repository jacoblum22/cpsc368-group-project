# Q4: SQL vs. MongoDB Comparison

Both versions answer the same question: how do review scores relate to player engagement (CCU at 1 year)? Oracle joins three tables and fetches raw rows, then bins scores and computes medians in Python. MongoDB reads from one embedded collection with no joins needed, and does the binning directly in the pipeline.

The main difference is median calculation. Oracle has a built-in MEDIAN() function. We can't do $median with MongoDB, so we sort before grouping, collect CCU values into an array with $push, and pick the middle element with $arrayElemAt.

The results match. Higher review scores correlate with higher engagement in both versions. The metascore line climbs steadily; the user score line is noisier, with a spike at the 2.5 bin from review-bombed AAA titles. Bins with fewer than 5 games are filtered out.

The MongoDB pipeline is longer than the SQL query itself, but it handles binning and median computation that the Oracle version offloads to Python. So total code is comparable, MongoDB just pushes more work into the database.
