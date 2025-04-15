# 📈 Prometheus and 📊 Grafana on Azure Container Apps (Terraform)

This project deploys [Prometheus](https://prometheus.io/) and [Grafana](https://grafana.com) using [Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/overview) via [Terraform](https://www.terraform.io/). It's ideal for quickly spinning up a lightweight Prometheus & Grafana instance for metrics scraping or demos.

---

## 🚀 Features

- Deploys Prometheus using the official Docker image (`prom/prometheus:latest`)
- Exposes Prometheus via HTTPS using Azure Container App ingress
- Deploys Grafana using the official Docker image (`grafana/grafana:latest`)
- Exposes Prometheus via HTTPS using Azure Container App ingress
- Uses Azure Log Analytics workspace for container monitoring
- Easily extensible for configs, persistent storage, or custom domains

---

## 📦 Prerequisites

- [Terraform v1.3+](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Azure subscription with `Microsoft.App` and `Microsoft.OperationalInsights` providers registered:

```bash
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.App
```

---

## 🔐 Authentication Setup

### Option 1: Azure CLI (for local development)

```bash
az login
az account set --subscription "<your-subscription-id>"
```

---

## 🛠️ How to Use

### 1. Clone the Repo

```bash
git clone <this-repo>
cd azure-prometheus-grafana
```

### 2. Customize Variables

Edit `terraform.tfvars` or override via CLI:

```hcl
prefix              = "monitor"
location            = "East US"
resource_group_name = "monitoring"
```

### 3. Deploy with Terraform

```bash
terraform init
terraform apply
```

---

## 🌐 Accessing Prometheus

After deployment, Terraform will output the URL:

```bash
Outputs:

prometheus_url = "https://<app>.azurecontainerapps.io"
grafana_url = "https://<app>.azurecontainerapps.io"
```

Open this in your browser to access the Prometheus UI.

---

## 📄 File Structure

```
azure-prometheu-grafana/
├── container-app.tf   # Azure container app config
├── prometheus.tf      # Prometheus config
├── grafana.tf         # Grafana config
├── variables.tf       # Input variables
├── terraform.tfvars   # Variable values
└── outputs.tf         # Public URL output
```

---

## 🧩 Next Steps

- 🔒 Add authentication (Azure AD or identity provider)
- 💾 Mount Azure Files or Blob for persistent data
- 🌐 Configure a custom domain + certificate
- 🧠 Integrate with Azure Monitor or Grafana

---

## 📘 References

- [Prometheus Docs](https://prometheus.io/docs/)
- [Grafana Docs](https://grafana.com/docs/)
- [Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/)
- [Terraform AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
