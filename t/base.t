#!perl -w

# $Id: base.t,v 1.2 2004/09/17 03:41:21 david Exp $

use strict;
use Test::More tests => 48;

BEGIN { use_ok('Widget::Meta') }

# Try text kind.
ok my $wm = Widget::Meta->new(
#    kind   => 'text', # default
    tip    => 'Fill me in',
    size   => 32,
    length => 32,
), "Create new text Widget::Meta";

is $wm->kind, 'text', "Check text kind";
is $wm->name, '', "Check text name";
is $wm->value, undef, "Check text value";
is $wm->tip, 'Fill me in', "Check text tip";
is $wm->size, 32, "Check text size";
is $wm->length, 32, "Check text length";
is $wm->rows, 0, "Check text rows";
is $wm->cols, 0, "Check text cols";
is $wm->checked, 0, "Check text checked";
is ref $wm->options, 'ARRAY', "Check text for options array";
is scalar @{$wm->options}, 0, "Check text for no options";

# Try textarea kind.
ok $wm = Widget::Meta->new(
    kind   => 'textarea',
    name   => 'foo',
    value  => 'hello',
    length => 100,
    tip    => 'lotsa copy',
    rows   => 10,
    cols   => 74,
), "Create new textarea Widget::Meta";

is $wm->kind, 'textarea', "Check textarea kind";
is $wm->name, 'foo', "Check textarea name";
is $wm->value, 'hello', "Check textarea value";
is $wm->tip, 'lotsa copy', "Check textarea tip";
is $wm->size, 0, "Check textarea size";
is $wm->length, 100, "Check textarea length";
is $wm->rows, 10, "Check textarea rows";
is $wm->cols, 74, "Check textarea cols";
is $wm->checked, 0, "Check textarea checked";
is ref $wm->options, 'ARRAY', "Check textarea for options array";
is scalar @{$wm->options}, 0, "Check textarea for no options";

my $options = [[1 => 'One'], [2 => 'Two' ], [3 => 'Three']];
# Try select kind.
ok $wm = Widget::Meta->new(
    kind => 'select',
    name => 'test',
    value => 1,
    tip  => 'select me',
    options => $options,
), "Create new select Widget::Meta";

is $wm->kind, 'select', "Check select kind";
is $wm->name, 'test', "Check select name";
is $wm->value, 1, "Check select value";
is $wm->tip, 'select me', "Check select tip";
is $wm->size, 0, "Check select size";
is $wm->length, 0, "Check select length";
is $wm->rows, 0, "Check select rows";
is $wm->cols, 0, "Check select cols";
is $wm->checked, 0, "Check select checked";
is ref $wm->options, 'ARRAY', "Check select for options array";
is_deeply $wm->options, $options, "Check select options";

# Try another select kind with code ref.
ok $wm = Widget::Meta->new(
    kind => 'select',
    tip  => 'select me',
    options => sub { $options },
), "Create another new select Widget::Meta";

is $wm->kind, 'select', "Check another select kind";
is $wm->tip, 'select me', "Check another select tip";
is $wm->size, 0, "Check another select size";
is $wm->rows, 0, "Check another select rows";
is $wm->cols, 0, "Check another select cols";
is ref $wm->options, 'ARRAY', "Check another select for options array";
is_deeply $wm->options, $options, "Check another select options";

# Try a checkbox.
ok $wm = Widget::Meta->new(
    kind => 'checkbox',
    checked => 1,
), "Create new checkbox Widget::Meta";

is $wm->kind, 'checkbox', "Check checkbox kind";
is $wm->checked, 1, "Check checkbox checked";
