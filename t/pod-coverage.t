#!perl -w

# $Id: pod-coverage.t,v 1.1 2004/09/16 20:45:59 david Exp $

use strict;
use Test::More;
eval "use Test::Pod::Coverage 1.06";
plan skip_all => "Test::Pod::Coverage 1.06 required for testing POD coverage"
  if $@;

all_pod_coverage_ok();
