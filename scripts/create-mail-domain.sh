#!/bin/bash
set -e

DOMAIN="$1"
MAIL_SERVER_IP="$2"
SSH_KEY_PATH="$3"

PASSWORD1=$(openssl rand -base64 24)
PASSWORD2=$(openssl rand -base64 24)
PASSWORD3=$(openssl rand -base64 24)
PASSWORD4=$(openssl rand -base64 24)

ssh -o StrictHostKeyChecking=no -i "$SSH_KEY_PATH" root@"$MAIL_SERVER_IP" << EOF
/usr/local/vesta/bin/v-add-mail-domain admin $DOMAIN no no yes
/usr/local/vesta/bin/v-add-mail-account admin $DOMAIN admin $PASSWORD1
/usr/local/vesta/bin/v-add-mail-account admin $DOMAIN office $PASSWORD2
/usr/local/vesta/bin/v-add-mail-account admin $DOMAIN support $PASSWORD3
/usr/local/vesta/bin/v-add-mail-account admin $DOMAIN info $PASSWORD4
EOF

DKIM=$(ssh -o StrictHostKeyChecking=no -i "$SSH_KEY_PATH" root@"$MAIL_SERVER_IP" "cat /usr/local/vesta/data/users/admin/mail/$DOMAIN.pub 2>/dev/null | sed 's/-----BEGIN PUBLIC KEY-----//g' | sed 's/-----END PUBLIC KEY-----//g' | tr -d '\n'" || true)

echo "MAIL_ADMIN_PASSWORD=$PASSWORD1"
echo "MAIL_OFFICE_PASSWORD=$PASSWORD2"
echo "MAIL_SUPPORT_PASSWORD=$PASSWORD3"
echo "MAIL_INFO_PASSWORD=$PASSWORD4"
echo "MAIL_DKIM_KEY=$DKIM"
