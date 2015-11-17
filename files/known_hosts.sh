#!/bin/bash
array( 'github/com' )
for i in "$array[@]}
do
    #echo $h
    ip=$(dig +short $h)
    ssh-keygen -R $h
    ssh-keygen -R $ip
    ssh-keygen -H $ip >> /root/.ssh/known_hosts
    ssh-keygen -H $h >> /root/.ssh/known_hosts
done
