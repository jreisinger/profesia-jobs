[![Build Status](https://travis-ci.org/jreisinger/profesia-jobs.svg?branch=master)](https://travis-ci.org/jreisinger/profesia-jobs)

profesia-jobs
=============

[Graphs](http://jreisinger.github.io/profesia-jobs/) showing number of job
postings at [profesia.sk](http://profesia.sk) containing certain technical
terms.

Installation -- see `.travis.yml`.

Run from crontab on a server

    PERL5LIB='/home/jreisinger/perl5/lib/perl5'

    # Collecting data
    45 23 * * * PERL5LIB=$PERL5LIB $HOME/github-repos/profesia-jobs/profesia-jobs --count linux windows perl python ruby ccna cissp lpic 'linux perl' 'linux python' 'linux ruby' shell bash zabbix nagios icinga cluster bind apache nginx lighttpd varnish haproxy mysql postgresql oracle memcache redis jenkins puppet chef salt cfengine ansible docker devops cloud aws agile scrum >> $HOME/github-repos/profesia-jobs/jobs-count.csv
    55 23 * * * PERL5LIB=$PERL5LIB $HOME/github-repos/profesia-jobs/profesia-jobs         linux windows perl python ruby ccna cissp lpic 'linux perl' 'linux python' 'linux ruby' shell bash zabbix nagios icinga cluster bind apache nginx lighttpd varnish haproxy mysql postgresql oracle memcache redis jenkins puppet chef salt cfengine ansible docker devops cloud aws agile scrum >> $HOME/github-repos/profesia-jobs/jobs.csv

    # Persisting data and updating graphs
    15 00 * * * PERL5LIB=$PERL5LIB $HOME/github-repos/profesia-jobs/update-data

Show Linux shops and job titles

    wget http://reisingers.duckdns.org/~jreisinger/jobs.csv -O - | \
    perl -F';' -alne 'print "$F[1] ($F[3]): $F[4]" if $F[1] eq "linux"' | \
    sort | uniq | less

Adding new search terms

1. Add search term(s) in the crontab job (see above)
2. Modify %regex in update-data accordingly
3. Add new graph (.jpg) to repo and modify index.hmtl in gh-pages branch
