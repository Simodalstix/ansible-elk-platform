# 📊 ELK Stack Centralized Logging Platform

## 🎯 Project Overview
Production-ready centralized logging platform using Elasticsearch, Logstash, and Kibana with Ansible automation.

## 🏗️ Architecture
- **elk-master** (4GB RAM) - Elasticsearch + Kibana
- **elk-logstash** (2GB RAM) - Logstash processing  
- **app-server** (2GB RAM) - Sample app + Filebeat

## 🚀 Quick Start
```bash
# Deploy entire stack
make bootstrap

# Individual commands
make deploy        # Deploy ELK stack
make health-check  # Validate deployment
```

## 📁 Project Structure
```
elk-stack-ansible/
├── inventories/dev/hosts.yml    # VM inventory
├── roles/                       # Ansible roles
│   ├── common/                 # Base system setup
│   ├── elasticsearch/          # Search engine
│   ├── kibana/                # Visualization
│   ├── logstash/              # Log processing
│   ├── filebeat/              # Log shipping
│   └── sample-app/            # Demo application
├── playbooks/
│   ├── site.yml               # Main deployment
│   └── health-check.yml       # Validation
└── Makefile                   # Automation
```

## 🔧 Configuration
Update `inventories/dev/hosts.yml` with your VM IPs:
```yaml
elk-master: ansible_host: YOUR_MASTER_IP
elk-logstash: ansible_host: YOUR_LOGSTASH_IP  
app-server: ansible_host: YOUR_APP_IP
```

## 📊 Access Points
- **Kibana**: http://elk-master:5601
- **Elasticsearch**: http://elk-master:9200
- **Sample App**: http://app-server

## ✅ Features
- ✅ Single-command deployment
- ✅ Structured log parsing
- ✅ Index lifecycle management
- ✅ Health monitoring
- ✅ Sample application with realistic logs
- ✅ Nginx reverse proxy logs

## 🔍 Log Flow
```
Sample App → Filebeat → Logstash → Elasticsearch → Kibana
```
