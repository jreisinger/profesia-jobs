[![Build Status](https://travis-ci.org/jreisinger/profesia-jobs.svg?branch=master)](https://travis-ci.org/jreisinger/profesia-jobs)

## About

[Graphs](http://jreisinger.github.io/profesia-jobs/) showing number of job
postings at [profesia.sk](http://profesia.sk) containing certain technical
terms.

* `profesia-jobs` - search jobs at profesia.sk
* `gen-graph` - generate graph from CSV file created via `profesia-jobs --count`
* `update-data` - run `profesia-jobs` + `gen-graph` and commit and push new data (CSVs, graphs) to GitHub
* `clean-data` - helper script that remove duplicate lines from CSV files

`gen-graph` copes with duplicate data but you might want to clean up your
CSVs from time to time anyways by running `clean-data`.

## Usage

See `.travis.yml` for installation hints.

Setup crontab job

```
PERL5LIB="$HOME/perl5/lib/perl5"
PJ_DIR="$HOME/github-repos/profesia-jobs"

# Collect and persist data...
45 23 * * * PERL5LIB=$PERL5LIB $PJ_DIR/update-data
```

Show Linux shops and job titles

```
wget https://raw.githubusercontent.com/jreisinger/profesia-jobs/master/jobs.csv -O - | \
perl -F';' -alne 'print "$F[1] ($F[3]): $F[4]" if $F[1] eq "linux"' | \
sort | uniq | less
```

Add new search term

1. Modify `%terms` in `update-data` accordingly
2. If you create new category modify `index.hmtl` in *gh-pages* branch
