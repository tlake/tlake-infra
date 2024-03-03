# Ansible for my homelab

Playbooks for configuring parts of my homelab; most notably, the Raspberry Thicket (4-node microk8s cluster).

## Usage

Run ansible playbooks like so (`ping.yml`, for example):

```
ansible-playbook -i inventories/homelab.yml pb.ping.yml
```

## Thicket playbooks, in order

| Playbook                         | Description |
|----------------------------------|-------------|
| pb.provision_raspberry_pis.yml   | basic raspberry pi configuration, starting from first boot after os flash |
| pb.create_microk8s_cluster.yml   | get microk8s running on the thicket pis, join them into a cluster |
| pb.configure_pwm_fan_control.yml | get the case fans running at less than full bore |


## Utility playbooks

| Playbook                    | Description |
|-----------------------------|-------------|
| pb.ping.yml                 | check connectivity to all the hosts in the inventory |
| pb.reboot_thicket_pis.yml   | restart all the pis in the thicket, one at a time |
| pb.shutdown_thicket_pis.yml | gracefully shutdown the ticket pis, nicer than cutting the power |

