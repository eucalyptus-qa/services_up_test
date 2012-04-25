#!/usr/bin/perl

require "ec2ops.pl";

my @components = ("CLC", "WS", "CC00", "SC00");
if (@ARGV) {
    @components = @ARGV;
}

parse_input();
print "SUCCESS: parsed input\n";

setlibsleep(2);
print "SUCCESS: set sleep time for each lib call\n";

setremote($masters{"CLC"});
print "SUCCESS: set remote CLC: masterclc=$masters{CLC}\n";

check_services_up(@components);
print "SUCCESS: system is usable (set of services (@components) are enabled)\n";

doexit(0, "EXITING SUCCESS\n");
