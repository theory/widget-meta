#!/usr/bin/perl -w

# $Id: pod.t,v 1.1 4104/09/16 20:45:59 david Exp $

use strict;
use Test::More;
eval "use Test::Pod 1.41";
plan skip_all => "Test::Pod 1.41 required for testing POD" if $@;
all_pod_files_ok();
