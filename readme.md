
Simple Vagrant Provisioner
======================
Vagrant provisioner configured with all the basic services for quick and easy web development. Vagrant [Documentation](http://www.vagrantup.com/).

## Get Started

**Requeriments**
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://www.vagrantup.com/)

**Install**

01 - Clone this repository:
```
git clone https://github.com/wesleyalmd/vagrant-simple.git
```
02 - Run command:
```
vagrant up
```

## Usage

* In your browser, head to: `localhost:8080`
* Access phpMyAdmin: `localhost:8080/phpmyadmin` use `root` for username and password
* Access the virtual machine directly using: `vagrant ssh`
* Start machine: `vagrant up`
* Shutdown machine: `vagrant halt`
* Restart machine: `vagrant reload`
* Suspend effectively state of machine: `vagrant suspend`
* Resume machine that was previously suspended: `vagrant resume`
* To destroy the machine permanently: `vagrant desotry`

## Package

* Box Ubuntu (Trusty 14.04 x64)
* Apache 2.2
* PHP5 5.5
* MySQL 5.5
* phpMyAdmin
* Git
* Nodejs
* Zsh
