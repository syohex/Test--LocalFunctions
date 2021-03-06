#!perl

use strict;
use warnings;
use utf8;
use FindBin;
push @INC, "$FindBin::Bin/../lib";

# Test::LocalFunctions::Fast uses Compiler::Lexer.
# It is not up to user to install Compiler::Lexer.
BEGIN {
    use Test::More;
    eval 'use Compiler::Lexer';
    plan skip_all => "Compiler::Lexer required for testing Test::LocalFunctions::Fast" if $@;
}

use Test::LocalFunctions::Fast;

foreach my $lib (map{"t/lib/Succ$_.pm"} 1..1) {
    if ($lib =~ /Succ\d*.pm/) {
        require $&;
    }
    local_functions_ok($lib);
}

done_testing;
