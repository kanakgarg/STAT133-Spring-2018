hw04-kanak-garg
================
Kanak Garg
4/9/2018

Archives
========

``` r
source("../code/archive-functions.R")
raw_data <- read_archive('stringr')
clean_data <- clean_archive(raw_data)
plot_archive(clean_data)
```

![](../images/unnamed-chunk-1-1.png)

``` r
write.csv(clean_data, "../data/stringr-archive.csv")
```

``` r
rd_ggplot <- read_archive('ggplot2')
cd_ggplot <- clean_archive(rd_ggplot)
write.csv(cd_ggplot, "../data/ggplot2-archive.csv")
rd_xml <- read_archive('XML')
cd_xml <- clean_archive(rd_xml)
write.csv(cd_xml, "../data/xml-archive.csv")
rd_knitr <- read_archive('knitr')
cd_knitr <- clean_archive(rd_knitr)
write.csv(cd_knitr, "../data/knitr-archive.csv")
rd_dplyr <- read_archive('dplyr')
cd_dplyr <- clean_archive(rd_dplyr)
write.csv(cd_dplyr, "../data/dplyr-archive.csv")
```

``` r
newD <- rbind(cd_dplyr, cd_ggplot, cd_knitr, cd_xml)
ggplot(newD, aes(x = date, y = size, color = name)) +
  labs(y = 'Size (kilobytes)', x = 'Date') +
  geom_step()
```

![](../images/unnamed-chunk-3-1.png)

``` r
ggplot(newD, aes(x = date, y = size, color = name)) +
  geom_step() + 
  labs(y = 'Size (kilobytes)', x = 'Date') + 
  facet_wrap(~ name, scales = 'free')
```

![](../images/unnamed-chunk-3-2.png)

Regex Functions
===============

``` r
source("../code/regex-functions.R")
split_chars('Go Bears!')
```

    ## [1] "G" "o" " " "B" "e" "a" "r" "s" "!"

``` r
split_chars('Expecto Patronum')
```

    ##  [1] "E" "x" "p" "e" "c" "t" "o" " " "P" "a" "t" "r" "o" "n" "u" "m"

``` r
vec <- c('G', 'o', ' ', 'B', 'e', 'a', 'r', 's', '!') 
num_vowels(vec)
```

    ## a e i o u 
    ## 1 1 0 1 0

``` r
count_vowels("The quick brown fox jumps over the lazy dog")
```

    ## a e i o u 
    ## 1 3 1 4 2

``` r
count_vowels("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")
```

    ## a e i o u 
    ## 1 3 1 4 2

``` r
reverse_chars("gattaca")
```

    ## [1] "acattag"

``` r
reverse_chars("Lumox Maxima")
```

    ## [1] "amixaM xomuL"

``` r
reverse_words("sentence! this reverse")
```

    ## [1] "reverse this sentence!"

``` r
reverse_words("string")
```

    ## [1] "string"

Data “Emotion in Text”
======================

``` r
content = read.csv("../data/text-emotion.csv", stringsAsFactors = F)$content
```

3.1) Number of characters per tweet

``` r
counts = nchar(content)
print(summary(counts))
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00   43.00   69.00   73.41  103.00  167.00

``` r
hist(counts, breaks = seq(0, max(counts)+5, by=5))
```

![](../images/unnamed-chunk-6-1.png)

3.2) Number of Mentions

``` r
mts = 1:length(content)
for (i in mts) {
  mts[i] = sum(grepl("^[^@@]*@[A-Za-z0-9_]{1,15}$", str_split(content[i], " ")[[1]]))
}
mts = unlist(mts)
mCounts = table(mts)
barplot(mCounts)
```

![](../images/unnamed-chunk-7-1.png)

``` r
mCounts
```

    ## mts
    ##     0     1     2     3     4     5     6     7     8     9    10 
    ## 21375 17933   569    75    28    13     2     1     2     1     1

``` r
content[mts == 10]
```

    ## [1] "last #ff  @Mel_Diesel @vja4041 @DemonFactory @shawnmcguirt @SEO_Web_Design @ChuckSwanson @agracing @confidentgolf @tluckow @legalblonde31"

3.3) Hashtags

``` r
hashtags = 1:length(content)
hashtagLengths = rep(0,max(counts))

for (i in hashtags) {
  tweetWords = str_split(content[i], " ")[[1]]
  whichTags = grep("#[A-Za-z][A-Za-z0-9]*", tweetWords, val = T)
  
  lengthIndices = nchar(whichTags) - 1
  hashtagLengths[lengthIndices] = hashtagLengths[lengthIndices] + 1
  hashtags[i] = length(whichTags)
}

names(hashtagLengths) <- 1:length(hashtagLengths)
hashtagLengths <- hashtagLengths[hashtagLengths > 0]
hashtags = unlist(hashtags)
hashCounts = table(hashtags)

hashCounts
```

    ## hashtags
    ##     0     1     2     3     5     7     8     9 
    ## 39261   650    66    17     1     1     1     3

``` r
barplot(hashCounts)
```

![](../images/unnamed-chunk-8-1.png)

``` r
sum(hashtagLengths*as.numeric(names(hashtagLengths))/sum(hashtagLengths))
```

    ## [1] 7.963592

``` r
names(hashtagLengths[hashtagLengths == max(hashtagLengths)])
```

    ## [1] "4"

Avg = 7.963592 Mode = 4
