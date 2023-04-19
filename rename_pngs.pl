#!/usr/bin/perl
use strict;
# written by Inco Imai
# MIT License
# 20230419 initial commit

my $foo = `ls *.png`;
chomp $foo;

my @files = split /\n/, $foo;
for (my $i=0; $i<@files; ++$i){
  $files[$i] =~ /^(\D+)(\d+)\.png$/;
  my $new_file_name;
  my $prefix = $1;
  my $number = $2;
  if($prefix =~ /\_$/){
    $new_file_name = $prefix.$number."\.png";
    # do nothing
  }
  else{
    $new_file_name = $prefix."_".$number."\.png";
    `mv $files[$i] $new_file_name`;
  }
  #print $new_file_name."\n";
}

