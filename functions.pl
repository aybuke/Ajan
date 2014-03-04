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

foreach(@reject){
  @reject_reason=split(/;/, $reject[$_]);
  print "{$reject_reason[1]}\n";
}
