use strict;
use Encode;


$, = "\t";
$\ = " + ";
while(<>) {
    $_ = decode 'utf8', $_;
    #chomp;
    split /\t/;
    my @morphs = split / \+ /, $_[2];
    my $flag = 0;
    while(@morphs) {
        my $m = shift @morphs;
       if ($m =~ /\/SF/) {
            $flag = 1;
        }
        if($flag == 1) {
            print encode ('utf8', $m);
        }
 
    }
}
