# docker-compose-example

The docker compose example for setup...
- postgresql-read-replica mode

# clone this repo on both instance A and B 
# on instance A
- cd postgres-replica-containers/postgresql-master/
- sudo chmod a+x ./docker-init.sh
- sudo chmod a+x ./validate-synce.sh
- ./docker-init.sh
- cd ~/ 
- mkdir ~/data-slave
- sudo chmod a+x -R ~/data-slave/
- sudo chmod a+w -R ~/data-slave/
- sudo chmod a+r -R ~/data-slave/
- sudo cp -r postgres-replica-containers/postgresql-master/data-slave/*  ~/data-slave/  
- ssh-keygen
- cat ~/.ssh/id_rsa.pub

# on instance B 
- append last cat output to ./ssh/authorized_keys
- mkdir ~/data-slave
- sudo chmod a+x -R ~/data-slave/
- sudo chmod a+w -R ~/data-slave/
- sudo chmod a+r -R ~/data-slave/
- mkdir postgres-replica-containers/postgresql-slave/data-slave

# on instance A 
- ssh -i ~/.ssh/id_rsa ubuntu@instance-B-pub-IP
- then exit and back to A 
- scp -i ~/.ssh/id_rsa -r ./data-slave/*  ubuntu@instance-B-pub-IP:/home/ubuntu/data-slave/

# on instance B 
- sudo cp -r ~/data-slave/* postgres-replica-containers/postgresql-slave/data-slave/
- edit ip @ postgres-replica-containers/postgresql-master/data-slave/postgresql.auto.conf 
- cd postgres-replica-containers/postgresql-slave/
- sudo chmod a+x ./docker-init.sh
- ./docker-init.sh

# on instance A
- ./validate-synce.sh