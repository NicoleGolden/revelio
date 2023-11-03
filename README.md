# Text Analysis: <br>Top Keywords in Revelio Labs Published Articles
<p>Author: Nicole Golden<br> Date: November 2, 2023 </p>

## Data Source 
* Revelio Labs news headline: https://www.reveliolabs.com/news/latest/
* Revelio Labs publicaton headlines: https://www.reveliolabs.com/news/publication/
* Revelio Labs blog headlines: https://www.reveliolabs.com/blog/

## About this project  
* The `data.txt` file, located in the `data` folder, contains compiled text from headlines on Revelio Lab's news, publications, and blogs. 
* This potentially shows topics that Revelio Lab cares about. 
* The project involves aggregating frequently mentioned words that have appeared at least three times, providing valuable insights into the important topics for Revelio Labs.

## Methodoloty
* Most special characters (such as `%`, and `:`) are removed in the data. To ensure consistency of the data analysis:  (i) The plural nouns formatted as singular words;  (ii) The verbs are formatted in original forms; (iii) Some words are grouped together (such as "lay off") for analytical purposes.

## Figure 
![](figure/revelio_text_greater3.png)
