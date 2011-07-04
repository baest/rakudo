# This file contains various stubs. Note that a few are created already
# outside of the setting, such as Mu/Any/Cool, Attribute, Signature/Parameter,
# Code/Block/Routine/Sub/Method and Str/Int/Num. They are built in BOOTSTRAP.pm
# in Perl6::Metamodel for now, though should be a BEGIN block in CORE.setting
# in the end.
my class Junction is Mu { }
my class Whatever is Cool { ... }
my class WhateverCode is Code { }
my class Bag is Iterable does Associative { }
my class Buf is Iterable does Positional { }
my class Set is Iterable does Associative { }
my class KeyHash is Iterable does Associative { }
my class Capture { }
my class Seq is List does Positional { }

sub DYNAMIC(\$name) { 
    my Mu $x := pir::find_dynamic_lex__Ps(nqp::unbox_s($name));
    if nqp::isnull($x) {
        my $pkgname = nqp::p6box_s(pir::replace__Ssiis(nqp::unbox_s($name), 1, 1, ''));
        if GLOBAL.WHO.exists($pkgname) { $x := GLOBAL.WHO{$pkgname} }
        elsif PROCESS.WHO.exists($pkgname) { $x := PROCESS.WHO{$pkgname} }
        else { fail "Dynamic variable $name not found" }
    }
    $x
}

