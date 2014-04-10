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
  ($one, $two, $three, $four, $five) = split(/ /);
  push (@two, $two);
}
for ($i=0; $i<$size; $i++){
print MYFILE_1 ("$two[$i]  - $second[$i] \n");
}
close (MYFILE_1);

