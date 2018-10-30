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
CSVs from time to time anyways by running `clean-data`

## Installation

See `.travis.yml` for installation hints.

Use git lfs for storing large files:

* https://git-lfs.github.com/

Setup crontab job (check your directory paths):

```
# Collect and persist data...
15 23 * * * PERL5LIB=/home/reisinge/perl5/lib/perl5 /home/reisinge/github-repos/profesia-jobs/update-data
```

## Usage

See [Graphs](http://jreisinger.github.io/profesia-jobs/).

Show Linux shops and job titles:

```
cat https://raw.githubusercontent.com/jreisinger/profesia-jobs/master/jobs.csv | \
perl -F';' -alne 'print "$F[1] ($F[3]): $F[4]" if $F[1] eq "linux"' | \
sort | uniq | less
```

## Add new search term

1. Modify `%terms` in `update-data` accordingly
2. Check `index.hmtl` in *gh-pages* branch - use `gen-index`.
