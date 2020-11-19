# Prometheus

## Introduction
This Vagrantfile will bootstrap 1 master node and 1 worker node for installing a small Kubernetes cluster.

## Prerequisites
- Install [Virtual Box](https://www.virtualbox.org/)
- Install [Vagrant](https://www.vagrantup.com/)

---
## Steps
1. Download official repo
```
git clone https://github.com/oracle/vagrant-projects
```
2. Download Oracle binary and place into the corresponding vagrant folder
> e.g. for Oracle 12C, download from [here](https://www.oracle.com/database/technologies/oracle12c-linux-12201-downloads.html) and place it into OracleDatabase/12.1.0.2 folder

3. Go to corresponding directory
> e.g. go to OracleDatabase/12.1.0.2 folder

4. Startup Vagrant
```bash
vagrant up
```

5. (Optional) Install SQLPlus
   1. [Install guide](https://zwbetz.com/install-sqlplus-on-a-mac/)
   2. [Download](https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html)

6. Connect to DB
```
sqlplus username/password@//localhost:1521/dbname
```

## Delete
```sh
vagrant destroy
```
