# User Guide

At this stage you should have Enigma installed but it won't be running yet.

Enigma is composed of 4 major parts

* [Apache Hadoop](http://hadoop.apache.org/)
* [Apache Spark](http://spark.apache.org/)
* [Apache Zookeeper](http://zookeeper.apache.org/)
* [Apache Kafka](http://kafka.apache.org/) 



## Starting Enigma
We have configured Enigma with some sensible default values for you, so all you should have to do is run it.


First, log onto the VM using vagrant.

    vagrant ssh


You should see a number of directories
    
    ./enigma
    ./enigma_installers
    ./ingress
    
The enigma directory contains the full installation.

The enigma_installers contains the install media that was used by Vagrant to install Enigma

The ingress directory is used by the File Reader component to get files efficiently from your file system into HDFS

Now we can start Enigma

    cd enigma
    #setup your environment
    . ./env-enigma
    
    cd bin
    #start Hadoop, Zookeeper and Kafka
    ./start-enigma-framework.sh
    
Enigma is now running.

## View the Hadoop operations pages for YARN and HDFS
Hadoop HDFS has a web based management app that allows you to see what's going on with HDFS.  You can access this at http://<ip address>: 

YARN has a web based management app that allows you to see what jobs are running and their current status.  You can also see the status of your Spark jobs in this app.  You can access this here http://<ip address>:/



## Stopping Enigma

    cd $HOME/enigma
    # setup your env if you haven't already done so
    . ./env-enigma
    ./stop-enigma-framework.sh