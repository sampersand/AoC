open STDIN, 'day22.txt';

sub play(&$$) {
  my $p1 = $_[1];
  my $p2 = $_[2];

  while(@$p1 && @$p2) {
  	print "@$p1 : @$p2\n";
  	my $c1 = shift $p1;
  	my $c2 = shift $p2;

  	if (('' ne ($x = $_[0]->($c1, $c2))) ? $x : $c2 < $c1) {
  		push $p1, $c1, $c2;
  	} else {
  		push $p2, $c2, $c1;
  	}
  	# 31314
  	# print defined $x;
  	# print "[@$p1][@$p2]\n";
  }

  $p1=$p2 unless @$p1;

  our$ans=0;
  $ans += ($#$p1-$_+1)*$p1->[$_] for 0..$#{$p1};
  $ans
}

sub recur($$){
  my $p1 = shift;
  my $p2 = shift;
	print "new: @$p1 / @$p2\n";
  my %memo=();

  play {
  	$memo{"@$p1$;@$p2"} ^= 1 or goto done;
  	if ($c1 <= $#p1+1 && $c2 <= $#p2 + 1) {
  		recur([@p1[0..$c1]],[@p2[0..$c2-1]])
		} else { ''
		}
  } $p1, $p2;
  # print("nop");
  done:
  scalar @$p2;
}

$/="";
@P1 = split "\n", <DATA>; shift @P1;
@P2 = split "\n", <DATA>; shift @P2;

# print play {} [@P1], [@P2];
recur \@P1, \@P2;
print $ans;
# print $P1[0];
# \my @P3 = \@P1;
=begin

def recur(p1,p2)
  memo = Set.new

  play p1,p2 do |c1, c2|
    memo.add? [p1,p2].hash or return true
    if c1 <= p1.length && c2 <= p2.length
      recur p1.first(c1), p2.first(c2)
    end
  end

  p2.empty?
end

P1, P2 = open('day22.txt')
  .each_line("\n\n")
  .map(&:chomp)
  .map(&:lines)
  .map { _1.drop(1).map(&:to_i) }

p play(P1.dup, P2.dup) {}
recur P1, P2
p $ans

=cut
__END__
Player 1:
9
2
6
3
1

Player 2:
5
8
4
7
10
