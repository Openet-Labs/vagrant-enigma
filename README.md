# vagrant-enigma
A vagrant based setup project for Openet's Enigma

# Table of Contents
1. [About Enigma](#about-enigma)
2. [Installation Instructions](#installation-instructions)
3. [Install Oracle VirtualBox](#install-oracle-virtualbox)
4. [Install Vagrant](#install-vagrant)
5. [Install Required Vagrant plugins](#install-required-vagrant-plugins)
6. [Windows Users](#windows-users)
7. [Clone the vagrant-enigma project](#clone-the-vagrant-enigma-project)
8. [Download a JDK](#download-a-jdk)
9. [Launch your VM](#launch-your-vm)
10. [Now do some work](#now-do-some-work)
11. [Explore](#explore)
12. [Known Issues](#known-issues)
13. [Finished?](#finished)
14. [Contact us](#contact-us)

## About Enigma
Enigma is a Big Data / Machine learning platform. It is based on a collection of Open Sources projects.


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

 

### Now do some work
Now that you have installed Enigma it's time to have it do something useful.  There is a fully working NFV Predictive Scaling Use Case maintained as a github project by Openet Labs.  You can find this project [here](https://github.com/Openet-Labs/machine-learning).  Follow the link to the Auto Scaling use case to get the source code and the instructions on how to download, build, install, run and test this use case

### Explore
If you choose to skip the pre-packaged use case, you can still experiment with Enigma.  You should have a read of the quick user guide setup [here](https://github.com/Openet-Labs/vagrant-enigma/blob/master/UserGuide.md).  This will guide you through the process of starting / monitoring / stopping Enigma and getting your own use cases running

### Finished?
When you're done exploring you can throw away the VM by running.  

    vagrant destroy
    
### Contact us
If you want to talk to us about production use or support then please visit [http://accelerate.openet.com/enigma/](http://accelerate.openet.com/enigma/}

## Known Issues
See the up to date list of [known issues](https://github.com/Openet-Labs/vagrant-enigma/issues) on github if you encounter a problem.  If your issue isn't listed there, then create a new one and we'll look into it

