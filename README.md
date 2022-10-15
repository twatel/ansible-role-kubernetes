# ansible-role-kubernetes

This role has goal to setup k8s cluster  

It configures:
* swap  
* iptables  
* docker / containerd  
* kubernetes cluster or single node  

## Variables 

### Default variables
``kubernetes_version``: Specifies the kubernetes version  
``kubernetes_gpg_key_url``: Specifies the kubernetes gpg key url  
``kubernetes_gpg_key_destination``: Specifies the kubernetes gpg key destination  
``kubernetes_apt_repository``: Specifies the kubernetes apt repository  
``kubernetes_apiserver_advertise_address``: Specifies the kubernets api server advertise address  
``kubernetes_pod_network_cidr``: Specifies the network_cidr  
``kubernetes_home_user_directory``: Specifies the kubernetes home directory  
``kubernetes_default_username``: Specifies the kubernetes default username  

``kubernetes_network_nodes_url``: Specifies which network pod to use  
``kubernetes_ingress_controller_url``: Specifies which ingress controller to use  

``kubernetes_cluster``: Specifies if installation is for an cluster or single node  

/!\ Required if ``kubernetes_cluster`` is equals true /!\  
``kubernetes_master_node``: Specifies which role the node use  

### Hosted variables
For cluster installation  
master vars file :  
```
---
# kubernetes part
kubernetes_cluster: true
kubernetes_master_node: true
```

worker vars file :  
```
---
# kubernetes part
kubernetes_cluster: true
kubernetes_master_node: false
```

For single_node installation  
master vars file :  
```
---
# kubernetes part
kubernetes_cluster: false
```

## Testing

For role testing :  
* make test-vbox-cluster  
* make test-vbox-single-node  

Vagrant testing is not implemented yet  
Ubuntu testing is not implemented yet  

You have to setup debian11 host & configure ssh authorized_keys yourself  
