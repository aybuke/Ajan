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

open (MYFILE, '>reject.txt');
foreach(@reject){
  @reject_reason=split(/;/, $reject[$_]);
  @from= split(/ /, $reject_reason[3]);
  print MYFILE "($from[1] - $reject_reason[1])\n";
}
close (MYFILE);
