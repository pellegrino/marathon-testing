# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "chef/centos-7.0"
  config.vm.define "node1" do |node1|
    node1.vm.network "private_network", ip: "192.168.33.10"
    node1.vm.hostname = "node1"
    node1.vm.box = "mesos-master"
  end

  config.vm.define "node2" do |node2|
    node2.vm.network "private_network", ip: "192.168.33.11"
    node2.vm.hostname = "node2"
  end

  config.vm.define "node3" do |node3|
    node3.vm.network "private_network", ip: "192.168.33.12"
    node3.vm.hostname = "node3"
  end

  config.vm.define "node4" do |node4|
    node4.vm.network "private_network", ip: "192.168.33.13"
    node4.vm.hostname = "node4"
  end
end