import smtplib
import os
from email.mime.text import MIMEText

domain = os.environ["DOMAIN"]
server_ip = os.environ["SERVER_IP"]
mail_server_ip = os.environ["MAIL_SERVER_IP"]
recipient = os.environ["ADMIN_EMAIL"]

db_user = domain.replace(".", "_")
db_password = os.environ.get("DB_PASSWORD", "")
db_root_password = os.environ.get("DB_ROOT_PASSWORD", "")
admin_password = os.environ.get("ADMIN_PASSWORD", "")
mail_admin_pass = os.environ.get("MAIL_ADMIN_PASSWORD", "")
mail_office_pass = os.environ.get("MAIL_OFFICE_PASSWORD", "")
mail_support_pass = os.environ.get("MAIL_SUPPORT_PASSWORD", "")
mail_info_pass = os.environ.get("MAIL_INFO_PASSWORD", "")

body = f"""
Server Created: {domain}
========================================

SERVER
Server IP: {server_ip}
Domain: {domain}

DATABASE
DB User: {db_user}
DB Password: {db_password}
DB Root Password: {db_root_password}

phpMyAdmin: http://{server_ip}:8080

MAIL ACCOUNTS
admin@{domain} - {mail_admin_pass}
office@{domain} - {mail_office_pass}
support@{domain} - {mail_support_pass}
info@{domain} - {mail_info_pass}

========================================
"""

msg = MIMEText(body)
msg["Subject"] = f"Server Created: {domain}"
msg["From"] = f"admin@{domain}"
msg["To"] = recipient

try:
    server = smtplib.SMTP(mail_server_ip, 587)
    server.starttls()
    server.login(f"admin@{domain}", mail_admin_pass)
    server.send_message(msg)
    server.quit()
    print(f"Credentials sent to {recipient}")
except Exception as e:
    print(f"Failed to send email: {e}")
    print("Credentials are available in workflow summary")
