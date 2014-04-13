#!/usr/bin/perl

use JSON;
use Data::Dumper;

open(LOG, "<sorunlu-edu-alanlar.txt");

while(<LOG>){
  push(@array, $_);
}
close(LOG);

foreach (@array){
  @reject= grep{/reject/} @array;
  @dump= grep{/dump/} @array;
}
$size = scalar(@reject);
open (MYFILE_1, '>reject.txt');
foreach(@reject){
  ($first, $second, $thirth, $fourth) = split(/;/);
  push (@second, $second);
  push (@fourth, $fourth);
}

foreach(@fourth){
  ($one, $two, $three, $four) = split(/ /);
  push (@two, $two);
}

foreach(@two){
  ($from1, $from2) = split(/@/);
  push (@from2, $from2);
}

for ($i=0; $i<$size; $i++){
print MYFILE_1 ("$two[$i]  - $second[$i] \n");
}
close (MYFILE_1);

open(REJECT, "<reject.txt");
while(<REJECT>){
  push(@uniq, $_);
}
close(REJECT);

foreach(@uniq){
  ($from) = split(/ /);
  push (@from, $from);
}

foreach(@from){
  ($before, $after) = split(/@/);
  push (@from2, $after);
}


my $json = '["edu.tr", {"adet" : "***", "reason" : "$second"}]';

my @decoded_json = @{decode_json($json)};
print Dumper(@decoded_json), "\n";
