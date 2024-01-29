#!/#!/usr/bin/env bash

echo "At $(date)" >> log/job.log

# --- to schedul this script: ---
# ./scheduling-jobs | at 10:50 AM

# --- to check the jobs in queue ---
# atq
# output: 3	    Mon Jan 29 11:00:00 2024 a ilyasse

# --- to remove the jobs in queue ---
# atrm <number_of_queue>
# atrm 3
