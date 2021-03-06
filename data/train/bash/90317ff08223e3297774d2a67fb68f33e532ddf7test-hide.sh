#!/bin/bash

. $TESTS/functions.sh

test_compile hide-01 "
channel a
channel b

P = a -> STOP [] b -> STOP \\ {a}" "P" \
"process P;
process P.0;
event a;
process P.1;
prefix P.1 = a -> STOP;
event b;
process P.2;
prefix P.2 = b -> STOP;
extchoice P.0 = P.1 [] P.2;
hide P = P.0 \ {a};"

test_compile hide-02 "
channel a
channel b
channel c

P = a -> STOP [] b -> STOP [] c -> STOP \\ {a}" "P" \
"process P;
process P.0;
process P.1;
event a;
process P.2;
prefix P.2 = a -> STOP;
event b;
process P.3;
prefix P.3 = b -> STOP;
extchoice P.1 = P.2 [] P.3;
event c;
process P.4;
prefix P.4 = c -> STOP;
extchoice P.0 = P.1 [] P.4;
hide P = P.0 \ {a};"
