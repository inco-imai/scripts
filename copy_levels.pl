#!/usr/bin/perl
use strict;
use Tk;
use File::Basename;
# reference: https://www.tohoho-web.com/perl/perltk.htm

my $top = MainWindow->new();
my $updir = `pwd`;
chomp $updir;
$updir = dirname($updir);
#print $updir,"\n";

my $dname = $top->chooseDirectory(-initialdir => '../', -title => 'Choose a directory');
exit() if ($dname eq $updir); #default

if (!defined $dname){
  warn 'No directory selected';
} else {
  print "Selected $dname\n";
}

my $cdir = `pwd`;
chomp $cdir;
if ($cdir ne $dname){
  `cp "$dname"/*.tlv ./`;
  print "copied\n";
} else {
  print 'Current directory selected. Nothing happened.\n';
}
exit();

