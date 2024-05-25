 #!/bin/bash

echo "Hostname : $(hostname)"
echo "CPU Info :"
lscpu | grep 'Model name'
echo " Memory Information"
free -h | grep 'Mem:'
echo "Disk usage"
df -h | grep '^/dev'

