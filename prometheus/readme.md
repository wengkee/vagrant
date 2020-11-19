# Prometheus

## Introduction
This Vagrantfile will bootstrap a server with Prometheus installed.

## Prerequisites
- Install [Virtual Box](https://www.virtualbox.org/)
- Install [Vagrant](https://www.vagrantup.com/)
- Install [Virtual Box plugin in Vagrant](https://github.com/dotless-de/vagrant-vbguest)

```sh
vagrant plugin install vagrant-vbguest
```
---
## Steps
1. For customized scrape, define a 'custom.yaml' and place in the same folder as Vagrantfile, it will be mounted as /vagrant/custom.yaml.

        Note: to scrape host, use 60.60.60.1:<port>

2. Startup Vagrant
    ```bash
    vagrant up
    ```

3. Browse Prometheus page at 127.0.0.1:9090

---

## Sample custom.yaml


```yaml
global:
  scrape_interval:     15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
    - targets: ['localhost:9090']

  - job_name: 'a-custom-job'

    static_configs:
    - targets: ['60.60.60.1:8888'] # to scrape host app at port 8888
      labels:
        app: 'dev'

    - targets: ['127.0.0.1:8889'] # to scrape local app at port 8889
      labels:
        app: 'local'
```

## Delete
```sh
vagrant destroy
```
