#!/bin/bash
for o in $(seq 2 2 2); do
    for po in $(seq 2.5 0.5 10.000); do
        for osc in $(seq 2 .25 2.00); do
            for freq in $(seq .6 .2 .800); do
                echo "${osc} ${freq} ${po} 1500 ${o}" >> params.dat
            done
        done
    done
done
