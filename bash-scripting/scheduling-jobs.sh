#!/usr/bin/env bash

/usr/bin/echo "At $(date)" >> log/job.log

# --- to schedul this script: ---
# at 11:50 AM -f ./scheduling-jobs.sh

# --- to check the jobs in queue ---
# atq
# output: 3	    Mon Jan 29 11:50:00 2024 a ilyasse

# --- to remove the jobs in queue ---
# atrm <number_of_queue>
# atrm 3
