#!/usr/bin/env bash
# .Please manually remove this etcd member using etcdctl
# [reset] Stopping the kubelet service
sudo systemctl stop kubelet
# [reset] Unmounting mounted directories in "/var/lib/kubelet"
sudo rm -rf /var/lib/kubelet/*
# [reset] Deleting contents of config directories: [/etc/kubernetes/manifests /etc/kubernetes/pki]
sudo rm -rf /etc/kubernetes/manifests/*
sudo rm -rf /etc/kubernetes/pki/*
# [reset] Deleting files: [/etc/kubernetes/admin.conf /etc/kubernetes/kubelet.conf /etc/kubernetes/bootstrap-kubelet.conf /etc/kubernetes/controller-manager.conf /etc/kubernetes/scheduler.conf]
sudo rm -rf /etc/kubernetes/admin.conf 
sudo rm -rf /etc/kubernetes/kubelet.conf 
sudo rm -rf /etc/kubernetes/bootstrap-kubelet.conf 
sudo rm -rf /etc/kubernetes/controller-manager.conf 
sudo rm -rf /etc/kubernetes/scheduler.conf
# [reset] Deleting contents of stateful directories: [/var/lib/etcd /var/lib/kubelet /var/lib/dockershim /var/run/kubernetes /var/lib/cni]
sudo rm -rf /var/lib/etcd/* 
sudo rm -rf /var/lib/kubelet/* 
sudo rm -rf /var/lib/dockershim/* 
sudo rm -rf /var/run/kubernetes/* 
sudo rm -rf /var/lib/cni/*
# The reset process does not clean CNI configuration. To do so, you must remove /etc/cni/net.d
sudo rm -rf /etc/cni/net.d
# The reset process does not reset or clean up iptables rules or IPVS tables.
# If you wish to reset iptables, you must do so manually by using the "iptables" command.
# 
# If your cluster was setup to utilize IPVS, run ipvsadm --clear (or similar)
# to reset your system's IPVS tables.
# 
# The reset process does not clean your kubeconfig files and you must remove them manually.
# Please, check the contents of the $HOME/.kube/config file.

sudo systemctl restart docker