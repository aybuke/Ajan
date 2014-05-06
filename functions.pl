#!/usr/bin/perl

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

foreach (@after_at){
  ($before_l, $after_l) = split(/>/);
  push(@before_l, $before_l);
}

system("uniq reject.txt > reject_summary.txt");

open(SUM, "<reject_summary.txt");

while(<SUM>){
  push (@sum, $_);
}
close(SUM);

$size2 = scalar(@sum);

foreach (@sum){
  ($sum_before, $sum_after) = split(/@/);
  push(@sum_after, $sum_after);
}

foreach (@sum_after){
  ($sum_lb, $sum_la) = split(/>/);
  push(@sum_lb, $sum_lb);
} 

open (XMLFILE, '>reject.xml');

print XMLFILE ("<okullar>\n");

for ($j=0; $j<$size2; $j++){
  print XMLFILE (" <okul>$sum_lb[$j] \n");
  print XMLFILE (" <from>$two[$j]</from>\n");
  print XMLFILE (" <reason>$second[$j]</reason>\n");
  print XMLFILE (" </okul> \n");
}

print XMLFILE ("</okullar> \n");
