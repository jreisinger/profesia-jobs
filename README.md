profesia-jobs
=============

Installation

    cpanm Mojo::UserAgent
    profesia-jobs --man

crontab

    45 23 * * * PERL5LIB=$PERL5LIB $HOME/bin/profesia-jobs --count linux windows perl python ruby ccna cissp lpic 'linux perl' 'linux python' 'linux ruby' shell bash zabbix nagios icinga cluster bind apache nginx lighttpd varnish haproxy mysql postgresql oracle memcache redis jenkins >> $HOME/public_html/jobs-count.csv
    55 23 * * * PERL5LIB=$PERL5LIB $HOME/bin/profesia-jobs         linux windows perl python ruby ccna cissp lpic 'linux perl' 'linux python' 'linux ruby' shell bash zabbix nagios icinga cluster bind apache nginx lighttpd varnish haproxy mysql postgresql oracle memcache redis jenkins >> $HOME/public_html/jobs.csv
