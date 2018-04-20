[![Build Status](https://travis-ci.org/jreisinger/profesia-jobs.svg?branch=master)](https://travis-ci.org/jreisinger/profesia-jobs)

## About

[Graphs](http://jreisinger.github.io/profesia-jobs/) showing number of job
postings at [profesia.sk](http://profesia.sk) containing certain technical
terms.

There are three scripts:

* `profesia-jobs` - search jobs at profesia.sk
* `gen-graph` - generate graph from CSV file created via `profesia-jobs --count`
* `update-data` - helper script that runs tests, runs `gen-graph`, commits and pushes to GitHub

## Usage

See `.travis.yml` for installation hints.

Setup crontab jobs:

```
PERL5LIB="$HOME/perl5/lib/perl5"
PJ_DIR="$HOME/github-repos/profesia-jobs"

# Collect data...
45 23 * * * cd $PJ_DIR && PERL5LIB=$PERL5LIB ./profesia-jobs --count linux windows perl python ruby ccna cissp lpic 'linux perl' 'linux python' 'linux ruby' 'linux bash' 'linux shell' shell bash zabbix nagios icinga cluster bind apache nginx lighttpd varnish haproxy mysql postgresql oracle memcache redis jenkins puppet chef salt cfengine ansible docker devops cloud aws agile scrum >> $HOME/github-repos/profesia-jobs/jobs-count.csv
55 23 * * * cd $PJ_DIR && PERL5LIB=$PERL5LIB ./profesia-jobs         linux windows perl python ruby ccna cissp lpic 'linux perl' 'linux python' 'linux ruby' 'linux bash' 'linux shell' shell bash zabbix nagios icinga cluster bind apache nginx lighttpd varnish haproxy mysql postgresql oracle memcache redis jenkins puppet chef salt cfengine ansible docker devops cloud aws agile scrum >> $HOME/github-repos/profesia-jobs/jobs.csv

# Persist data and update graphs...
15 00 * * * cd $PJ_DIR && PERL5LIB=$PERL5LIB ./update-data
```

## Howtos

Show Linux shops and job titles

```
wget https://raw.githubusercontent.com/jreisinger/profesia-jobs/master/jobs.csv -O - | \
perl -F';' -alne 'print "$F[1] ($F[3]): $F[4]" if $F[1] eq "linux"' | \
sort | uniq | less
```

Add new search term

1. Add search term(s) in the crontab job (see above)
2. Modify `%regex` in `update-data` accordingly
3. Add new graph (.jpg) to repo and modify `index.hmtl` in *gh-pages* branch
