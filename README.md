profesia-jobs
=============

Installation and running

    cpanm Mojo::UserAgent
    profesia-jobs --man
    gen-graph --man

crontab

    45 23 * * * PERL5LIB=$PERL5LIB $HOME/bin/profesia-jobs --count linux windows perl python ruby ccna cissp lpic 'linux perl' 'linux python' 'linux ruby' shell bash zabbix nagios icinga cluster bind apache nginx lighttpd varnish haproxy mysql postgresql oracle memcache redis jenkins >> $HOME/public_html/jobs-count.csv
    55 23 * * * PERL5LIB=$PERL5LIB $HOME/bin/profesia-jobs         linux windows perl python ruby ccna cissp lpic 'linux perl' 'linux python' 'linux ruby' shell bash zabbix nagios icinga cluster bind apache nginx lighttpd varnish haproxy mysql postgresql oracle memcache redis jenkins >> $HOME/public_html/jobs.csv

Cookbook

    wget -O jobs-count.csv http://pub.ist.ac.at/~jreisinger/jobs-count.csv
    ./gen-graph --select '^(python|perl|ruby)$' --xskip 28 --title "Scripting Languages"
