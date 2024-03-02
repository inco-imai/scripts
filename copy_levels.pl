#!/usr/bin/perl
use strict;
use Tk;
use File::Basename;
# reference: https://www.tohoho-web.com/perl/perltk.htm

=pod
<USAGE>
Go to a directory where old *.tlv files and the current .tnz file exist in.
Open a terminal of Ubuntu (WSL2).
Then execute this file as below:
$ ./copy_levels.pl
A window will popup.
Select a directory where new *.tlv files exist in and a replacement will happen.

This script uses Tk so install Tk like
$ sudo apt-get install perl-tk
.
=cut

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

