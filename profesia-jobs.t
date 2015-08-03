#!/usr/bin/perl
use Local::Modulino;
use LWP::Simple;
use Test::More;

my @search_terms =
  ( "windows", "perl", "ruby", "lpic", "linux", "linux perl", "linux python" );

for my $search (@search_terms) {

    # My script search results count
    my $n_pages = Local::Modulino::pages($search);
    my $offers = Local::Modulino::search_pages( $search, $n_pages );

    # Profesia web search results count
    my $url =
      qq(http://www.profesia.sk/search.php?which_form=simple&tab_name=&log_term=1&cnt_offered=&search_anywhere=$search&submit_search_simple.x=0&submit_search_simple.y=0);
    my $content = get($url) or die 'Unable to get page';
    ( my $n_offers ) = $content =~ /ponuky\s+\((\d+)\)/;

    is( scalar @$offers, $n_offers, "Number of offers for $search" );
}

done_testing();
