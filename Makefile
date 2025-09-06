.PHONY: bootstrap deploy health-check clean validate

bootstrap: validate deploy health-check

validate:
	ansible-playbook -i inventories/dev/hosts.yml playbooks/validate.yml

deploy:
	ansible-playbook -i inventories/dev/hosts.yml playbooks/site.yml

health-check:
	ansible-playbook -i inventories/dev/hosts.yml playbooks/health-check.yml

clean:
	ansible-playbook -i inventories/dev/hosts.yml playbooks/site.yml --tags cleanup