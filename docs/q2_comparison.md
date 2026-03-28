# Q2: SQL vs. MongoDB Comparison

Both versions accomplish the same task of answering whether price tiers relate to review quality (referring to critic and user scores) across different genres. The SQL version joins the games and reviews tables, bins prices into tiers, and uses MEDIAN on metascore and user_score to get the review quality per tier. With MongoDB, it's a single collection with an embedded review field, creating price_tier using $addFields and $switch, along with an aggregation pipeline to compute the median critic and user score for each genre and price tier. This is then plotted as a heatmap.
 
The difference here is how the aggregation and the schema are structured. Oracle uses a GROUP BY function with a relational schema and relies on the provided MEDIAN() function. MongoDB utilizes a pipeline and works with nested fields to compute medians using a sort-then-push-then-pick approach (pre-sorting by score, collecting values into an array with $push, then extracting the middle element with $arrayElemAt), since MongoDB does not have a built-in MEDIAN() function.
 
The final results show a similar story between the systems. For SQL, games within higher-priced tiers had better median metascore and user score compared to games that were lower in cost. MongoDB showed similar findings, with higher average scores for higher and mid-tier games, and fewer free or low-tier games scoring as well.
 
The logic is similar for the MongoDB pipeline but longer compared to the SQL query. The same logic behind price tiers and aggregation is used, but it is now combined with Python processing. Both reveal similar relationships, but one relies on internal database functions while the other operates through the pipeline.
