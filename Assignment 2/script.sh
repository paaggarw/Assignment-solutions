#!/bin/bash
echo "Please enter host names in a comma separated list:"
read host_names
echo "Please enter a command you want to run on these hosts:"
read command

# iterate  over the list of comma separated hosts connect to each of them and run command specifies.
for host_name in $(echo $host_names | sed "s/,/ /g")
do
    ssh root@$host_name $command

done
