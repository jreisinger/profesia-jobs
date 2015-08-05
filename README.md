[![Build Status](https://travis-ci.org/jreisinger/profesia-jobs.svg?branch=master)](https://travis-ci.org/jreisinger/profesia-jobs)

profesia-jobs
=============

Installation -- see `.travis.yml`

Collecting data (crontab on a server)

    PERL5LIB='/home/jreisinger/perl5/lib/perl5'
    45 23 * * * PERL5LIB=$PERL5LIB $HOME/bin/profesia-jobs --count linux windows perl python ruby ccna cissp lpic 'linux perl' 'linux python' 'linux ruby' shell bash zabbix nagios icinga cluster bind apache nginx lighttpd varnish haproxy mysql postgresql oracle memcache redis jenkins >> $HOME/public_html/jobs-count.csv
    55 23 * * * PERL5LIB=$PERL5LIB $HOME/bin/profesia-jobs         linux windows perl python ruby ccna cissp lpic 'linux perl' 'linux python' 'linux ruby' shell bash zabbix nagios icinga cluster bind apache nginx lighttpd varnish haproxy mysql postgresql oracle memcache redis jenkins >> $HOME/public_html/jobs.csv

Updating graphs (anywhere)

    ./update-data
