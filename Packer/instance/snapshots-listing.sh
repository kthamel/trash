#!/bin/bash

aws ec2 describe-snapshots \
    --owner-ids self \
    --filters Name=status,Values=completed \
    --query "Snapshots[*].{ID:SnapshotId,Time:StartTime}" | grep -o 'snap-[^,"]*' > snapshot_list.txt