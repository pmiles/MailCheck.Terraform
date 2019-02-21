#!/bin/bash
grep -E '^role-to-assume' "$TFVARS_FILE" | tr -d ' ' | awk '{print $2 }' FS='=' | awk '{print $2 }' FS='"'