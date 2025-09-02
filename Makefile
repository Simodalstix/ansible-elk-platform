.PHONY: bootstrap deploy health-check clean

bootstrap: deploy health-check

deploy:
	ansible-playbook -i inventories/dev/hosts.yml playbooks/site.yml

health-check:
	ansible-playbook -i inventories/dev/hosts.yml playbooks/health-check.yml

clean:
	ansible-playbook -i inventories/dev/hosts.yml playbooks/site.yml --tags cleanup