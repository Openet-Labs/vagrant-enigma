# vagrant-enigma
A vagrant based setup project for Openet's Enigma

## About Enigma
Enigma is a Big Data / Machine learning platform. It is based on a collection of Open Sources projects.

* [Apache Hadoop](http://hadoop.apache.org/)
* [Apache Spark](http://spark.apache.org/)
* [Apache Zookeeper](http://zookeeper.apache.org/)
* [Apache Kafka](http://kafka.apache.org/) 

Also included in the installation are 
* Scripts to managed these components (installation, start/stop etc)
* A set of out of the box use cases from Openet
* Custom components to aid in importing large quantities of data into Hadoop

## Installation Instructions
The installation instructions below will install Openet's Enigma into a Virtual Machine on your desktop PC.  This will enable you to evaluate the platform and see what's possible. 

These instructions will not be suitable for getting a Highly Available (3 VM mimimum) Enigma cluster running.  Please contact [Openet](http://openet.com) if you require assistance setting up a production quality cluster.


### Install Oracle VirtualBox
Install VirtualBox 5.x from here [https://www.virtualbox.org](https://www.virtualbox.org/)

### Install Vagrant
Install Vagrant from [https://www.vagrantup.com](https://www.vagrantup.com/)

#### Install Required Vagrant plugins
    vagrant plugin install vagrant-hostmanager
    vagrant plugin install vagrant-vbguest

#### Windows Users 
Ensure you have a `ssh.exe` on your PATH.  This will be needed by vagrant later on.  The easiest way is to install [Git for Windows](https://git-for-windows.github.io/) and use the Git shell that comes with it.  You can also use this git install to then clone the vagrant-enigma project onto your machine.  If you don't want to do this, then you could use putty.


### Clone the vagrant-enigma project
    cd <checkout location>
    git clone https://github.com/Openet-Labs/vagrant-enigma.git

### Download a JDK
Enigma requires a Java 8 JDK to run.  You can download this from [http://www.oracle.com/technetwork/java/javase/downloads/index.html](http://www.oracle.com/technetwork/java/javase/downloads/index.html).  Select the JDK download. Then when presented with a list of installers select the **Linux x64 RPM** based installer. You will need to accept the license terms from Oracle before you can download it.

Take the downloaded RPM and place it in `<checkout location>/vagrant-enigma/modules/java_install/files`

We have tested with JDK 1.8 Update 101.  If you have downloaded a newer version you'll need to update one file from the checkout to set the correct version number. 

Edit the file `<checkout location>/vagrant-enigma/modules/java_install/manifests/init.pp` and update the version number in the 2 places it occurs in the file (examples below)

    source => 'puppet:///modules/java_install/jdk-8u101-linux-x64.rpm',
    package { 'jdk1.8.0_101.x86_64':
    
### Launch your VM
This may take a while depending on your internet connection as the `vagrant up` step first downloads a suitable Virtual Machine image from the web, then downloads the Enigma installer media from [openet.com](http://www.openet.com) and then installs and configures everything.

    cd <checkout location>/vagrant-enigma
    vagrant up

---
If your host OS has multiple network interfaces, Ethernet and WiFi for example, you will be prompted to select which one to bridge the VM to.  Make sure you select an interface that has an internet connection as this will be used to download and install packages to when the VM is being setup for the first time.

Now might be a good time to go get a coffee (or even lunch if you have a slow internet connection).

---

 


