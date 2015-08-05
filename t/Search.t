#!/usr/bin/perl
use Local::Search;
use LWP::Simple qw($ua get);
use Test::More tests => 7;

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
        skip q(Can't search profesia.sk), 7 unless $content;
        ( my $n_offers ) = $content =~ /ponuky\s+\((\d+)\)/;

        # My script search results count
        my $n_pages = Local::Search::pages($search);
        my $offers = Local::Search::search_pages( $search, $n_pages );

        my $n_offers_mine = @$offers;

        # Offers can be added/removed in between the two searches so approximate
        # equality is checked
        my $ten_percent = $n_offers_mine / 10;
        my $test        = $n_offers_mine >= $n_offers - $ten_percent
          and $n_offers_mine <= $n_offers + $ten_percent;

        my $test_name =
          "number of offers for $search (mine: $n_offers_mine, profesia: $n_offers)";
        ok( $test, $test_name );
    }

}
