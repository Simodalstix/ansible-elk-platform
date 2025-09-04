.PHONY: bootstrap deploy health-check clean vm-start vm-stop vm-status

bootstrap: deploy health-check

deploy:
	ansible-playbook -i inventories/dev/hosts.yml playbooks/site.yml

health-check:
	ansible-playbook -i inventories/dev/hosts.yml playbooks/health-check.yml

clean:
	ansible-playbook -i inventories/dev/hosts.yml playbooks/site.yml --tags cleanup

vm-start:
	vmrun start ~/vmware/elk-master/elk-master.vmx nogui
	vmrun start ~/vmware/elk-logstash/elk-logstash.vmx nogui
	vmrun start ~/vmware/app-server/app-server.vmx nogui
	@echo "Waiting 30 seconds for VMs to boot..."
	sleep 30

vm-stop:
	vmrun stop ~/vmware/elk-master/elk-master.vmx
	vmrun stop ~/vmware/elk-logstash/elk-logstash.vmx
	vmrun stop ~/vmware/app-server/app-server.vmx

vm-status:
	vmrun list