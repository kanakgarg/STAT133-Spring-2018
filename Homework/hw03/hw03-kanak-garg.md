Untitled
================
Kanak Garg
3/23/2018

Piping
------

2.1

``` bash
cut -d "," -f 2 nba2017-roster.csv  | tail +2 | sort | uniq -c > team-names.txt
head -n 5 team-names.txt 
```

    ##   14 "ATL"
    ##   15 "BOS"
    ##   15 "BRK"
    ##   15 "CHI"
    ##   15 "CHO"

2.2

``` bash
cut -d "," -f 3 nba2017-roster.csv  | tail +2 | sort | uniq -c > position-names.txt
head -n 5 position-names.txt
```

    ##   89 "C"
    ##   89 "PF"
    ##   85 "PG"
    ##   83 "SF"
    ##   95 "SG"

2.3

``` bash
cut -d "," -f 7 nba2017-roster.csv | sort -n | uniq -c  | tail +2 > experience-counts.txt
head -n 5 experience-counts.txt
```

    ##   80 0
    ##   52 1
    ##   46 2
    ##   36 3
    ##   35 4

2.4

``` bash
grep "team" nba2017-roster.csv > LAC.csv
grep "LAC" nba2017-roster.csv >> LAC.csv
cat LAC.csv
```

    ## "player","team","position","height","weight","age","experience","salary"
    ## "Alan Anderson","LAC","SF",78,220,34,7,1315448
    ## "Austin Rivers","LAC","SG",76,200,24,4,1.1e+07
    ## "Blake Griffin","LAC","PF",82,251,27,6,20140838
    ## "Brandon Bass","LAC","PF",80,250,31,11,1551659
    ## "Brice Johnson","LAC","PF",82,230,22,0,1273920
    ## "Chris Paul","LAC","PG",72,175,31,11,22868828
    ## "DeAndre Jordan","LAC","C",83,265,28,8,21165675
    ## "Diamond Stone","LAC","C",83,255,19,0,543471
    ## "J.J. Redick","LAC","SG",76,190,32,10,7377500
    ## "Jamal Crawford","LAC","SG",77,200,36,16,13253012
    ## "Luc Mbah a Moute","LAC","SF",80,230,30,8,2203000
    ## "Marreese Speights","LAC","C",82,255,29,8,1403611
    ## "Paul Pierce","LAC","SF",79,235,39,18,3500000
    ## "Raymond Felton","LAC","PG",73,205,32,11,1551659
    ## "Wesley Johnson","LAC","SF",79,215,29,6,5628000

2.5

``` bash
grep "LAL" nba2017-roster.csv | cut -d "," -f 6 | sort | uniq -c 
```

    ##    2 19
    ##    1 20
    ##    2 22
    ##    3 24
    ##    2 25
    ##    2 30
    ##    2 31
    ##    1 37

2.6

``` bash
grep "CLE" nba2017-roster.csv | wc -l
```

    ##       15

2.7

``` bash
grep "team" nba2017-roster.csv | cut -d "," -f 1,4,5 > gsw-height-weight.csv
grep "GSW" nba2017-roster.csv | cut -d "," -f 1,4,5  >> gsw-height-weight.csv
cat gsw-height-weight.csv 
```

    ## "player","height","weight"
    ## "Andre Iguodala",78,215
    ## "Damian Jones",84,245
    ## "David West",81,250
    ## "Draymond Green",79,230
    ## "Ian Clark",75,175
    ## "James Michael McAdoo",81,230
    ## "JaVale McGee",84,270
    ## "Kevin Durant",81,240
    ## "Kevon Looney",81,220
    ## "Klay Thompson",79,215
    ## "Matt Barnes",79,226
    ## "Patrick McCaw",79,185
    ## "Shaun Livingston",79,192
    ## "Stephen Curry",75,190
    ## "Zaza Pachulia",83,270

2.8

``` bash
grep "team" nba2017-roster.csv | cut -d "," -f 1,8 > top10-salaries.csv
cut -d "," -f 1,8 nba2017-roster.csv | sort -t "," -k 2 -n -r | head -10 >> top10-salaries.csv
cat top10-salaries.csv
```

    ## "player","salary"
    ## "LeBron James",30963450
    ## "Russell Westbrook",26540100
    ## "Mike Conley",26540100
    ## "Kevin Durant",26540100
    ## "James Harden",26540100
    ## "DeMar DeRozan",26540100
    ## "Al Horford",26540100
    ## "Carmelo Anthony",24559380
    ## "Damian Lillard",24328425
    ## "Dwyane Wade",23200000

### Binomial Probability Functions

source("code/binomial-functions.R") first &lt;- bin\_probability(10, 3, 1/6) first second &lt;- bin\_distribution(10, 1/4) second plot(second) third = 0 for (x in 3:5) { third = third + bin\_probability(5, x, 0.35) } third fourth &lt;- bin\_distribution(15, 0.35) fourth plot(fourth)
