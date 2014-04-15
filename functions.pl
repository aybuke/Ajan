#!/usr/bin/perl

use XML::Simple;
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

open (REJECT, "reject.txt");
while(<REJECT>){
  push(@rjct, $_);
}
close(REJECT);

foreach (@rjct){
  ($ilk, $son) = split(/ - /);
  push (@ilk, $ilk);
  push (@son, $son);
}

foreach (@ilk){
  ($before_at, $after_at) = split(/@/);
  push (@after_at, $after_at);
}

open (XMLFILE, '>reject.xml');

print XMLFILE ("<okullar>\n");

for ($j=0; $j<$size; $j++){
  print XMLFILE ("  <okul>$after_at[$j] \n");
  print XMLFILE ("    <from>$two[$j]</from>\n");
  print XMLFILE ("    <reason>$second[$j]</reason>\n");
  print XMLFILE ("  </okul> \n");
}

print XMLFILE ("</okullar> \n");

