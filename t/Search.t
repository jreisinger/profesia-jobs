#!/usr/bin/perl
use Local::Search;
use LWP::Simple qw($ua get);
use Test::More;

SKIP: {

    my @search_terms = (
        "windows", "perl",       "ruby", "lpic",
        "linux",   "linux perl", "linux python"
    );

    for my $search (@search_terms) {

        # Profesia web search results count
        my $url =
          qq(http://www.profesia.sk/search.php?which_form=simple&tab_name=&log_term=1&cnt_offered=&search_anywhere=$search&submit_search_simple.x=0&submit_search_simple.y=0);
        $ua->agent('Mozilla/5.0');
        my $content = get($url);
        skip
          unless
          $content; # stopped working on travis for unknown reason, so I skip it
        ( my $n_offers ) = $content =~ /ponuky\s+\((\d+)\)/;

        # My script search results count
        my $n_pages = Local::Search::pages($search);
        my $offers = Local::Search::search_pages( $search, $n_pages );

        is( scalar @$offers, $n_offers, "Number of offers for $search" );
    }

}

done_testing();
