#!/usr/bin/perl
use Local::Graph;
use Test::More;
use 5.010;
use autodie;

# read_csv()
my $data;
{
    my $file = '/tmp/profesia-test.csv';
    open my $fh, ">", $file;
    say $fh "2015-01-25;linux perl;26";
    say $fh "2015-01-25;perl;59";
    say $fh "2015-01-25;python;49";
    say $fh "2015-01-26;linux perl;59";
    close $fh;

    $data = Local::Graph::read_csv($file);
    for my $date ( sort keys %$data ) {
        like( $date, qr/2015-01-2[56]/, "date read from CSV file" );
    }
}

# get_uniq_search_terms()
{
    my @uniq_terms = @{ Local::Graph::get_uniq_search_terms($data) };
    is( @uniq_terms,    3,            "number of unique search terms" );
    is( $uniq_terms[0], "linux perl", "unique search term" );
    is( $uniq_terms[1], "perl",       "unique search term" );
    is( $uniq_terms[2], "python",     "unique search term" );
}

# prepare_for_graphing
{
    my $expected = [
        [ '2015-01-25', '2015-01-26' ],
        [ '26',         '59' ],
        [ '59',         undef ],
        [ '49',         undef ]
    ];
    my $got = Local::Graph::prepare_for_graphing($data);
    is_deeply( $got, $expected, "prepare data for graphing" );
}

done_testing();
