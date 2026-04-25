# PHP Deployer

Infrastructure as Code for PHP server deployment on DigitalOcean.

## Stack

- **PHP 8.0** + Apache (CodeIgniter 3.x compatible)
- **MariaDB 10.5**
- **phpMyAdmin**
- **Docker Compose**
- **Cloudflare** (DNS + Proxy)

## Workflows

### Create Server
1. Go to Actions → Create Server
2. Enter domain or subdomain (e.g., `example.com` or `test.example.com`)
3. Run workflow
4. Credentials appear in workflow summary

### Add Cron Job
1. Go to Actions → Add Cron Job
2. Enter server IP, cron schedule, and command
3. Run workflow

### Scale Server
1. Go to Actions → Scale Server
2. Enter server IP and select new size
3. Run workflow (takes 5-15 minutes)

### Destroy Server
1. Go to Actions → Destroy Server
2. Enter server IP and type "DESTROY" to confirm
3. Run workflow

## Required Secrets

| Secret | Description |
|--------|-------------|
| `DO_TOKEN` | DigitalOcean API token |
| `DO_SSH_KEY_FINGERPRINT` | SSH key fingerprint in DO |
| `DO_SSH_PRIVATE_KEY` | SSH private key for server access |
| `ADMIN_SSH_PUB_KEY` | Admin's SSH public key |
| `DEVELOPER_SSH_PUB_KEY` | Developer's SSH public key |
| `CLOUDFLARE_API_TOKEN` | Cloudflare API token |
| `MAIL_SERVER_IP` | Mail server IP address |

## Required Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `ALLOWED_IPS` | IPs allowed for SSH and phpMyAdmin (JSON array) | `["1.2.3.4/32", "5.6.7.8/32"]` |

> If variables are not set, access is open to all IPs (`0.0.0.0/0`).

## Structure

```
├── terraform/          # DigitalOcean droplet management
├── ansible/            # Server configuration
├── server-template/    # Docker Compose template
└── .github/workflows/  # GitHub Actions
```
