# osTicket Golden Master v1.18.3

## Contents
- `osTicket-v1.18.3.zip` — Clean osTicket installation files
- `seed.sql` — Database schema + default configuration (no tenant data)

## Provisioning Steps (v1 Manual)

### 1. Create Hosting Account
- Log into SmarterASP.net reseller panel
- Create new hosting account for tenant
- Note FTP credentials and hosting URL

### 2. Create MySQL Database
- In SmarterASP.net control panel create new MySQL database
- Create database user with full permissions
- Note: host, database name, username, password

### 3. Deploy osTicket Files
- Download `osTicket-v1.18.3.zip` from this repo
- Connect via FTP to hosting account
- Upload and extract ZIP to `public_html/` or `www/`
- Set file permissions: `chmod 755` on directories, `644` on files

### 4. Run Database Seed
- Connect to MySQL via phpMyAdmin or MySQL client
- Run `seed.sql` against the new database
- This creates all tables and default configuration

### 5. Create Admin Account
- Run the following SQL replacing placeholders:
```sql
INSERT INTO ost_staff (firstname, lastname, email, username, passwd, isadmin, isactive, created, updated)
VALUES ('Admin', 'User', 'TENANT_EMAIL', 'admin', MD5(CONCAT('SALT', MD5('PASSWORD'))), 1, 1, NOW(), NOW());
```
- Store the password encrypted in `df_tenant_config`

### 6. Configure osTicket
- Update `ost_config` with the tenant's site URL and email settings
- Update `include/ost-config.php` with MySQL credentials

### 7. Activate in Portal Admin
- Enter MySQL credentials in Portal Admin → Accounts → DeskFlow Config
- Click "Mark as Ready" to send welcome email
- Tenant status updates to Active

## Post-Provisioning
- Tenant manages departments and help topics via DeskFlow Settings
- Agents log in at `https://vm.gapshop.net/login/{identifier}`
- Knowledge base at `https://vm.gapshop.net/kb/{identifier}`

## Provisioning Steps (v1 Manual)

### 1. Create Hosting Account
- Log into SmarterASP.net reseller panel
- Create new hosting account for tenant
- Note FTP credentials and control panel URL
- The hosting account is internal only — no public-facing content needed

### 2. Create MySQL Database
- In SmarterASP.net control panel create new MySQL database
- Create database user with full permissions
- Note: host, database name, username, password

### 3. Deploy osTicket Files
- Download `osTicket-v1.18.3.zip` from this repo
- Connect via FTP to hosting account
- Upload and extract ZIP to `public_html/` or `www/`
- Rename `include/ost-sampleconfig.php` to `include/ost-config.php`
- Update `ost-config.php` with MySQL credentials:
```php
define('DBHOST', 'MYSQL_HOST');
define('DBNAME', 'DATABASE_NAME');
define('DBUSER', 'DATABASE_USER');
define('DBPASS', 'DATABASE_PASSWORD');
define('SECRET_SALT', 'RANDOM_32_CHAR_STRING');
define('ADMIN_EMAIL', 'TENANT_ADMIN_EMAIL');
```

### 4. Run Database Seed
- Connect to MySQL via phpMyAdmin
- Run `seed.sql` against the new database
- This creates all tables and default configuration

### 5. Create Admin Account
- Run the following SQL replacing placeholders:
```sql
INSERT INTO ost_staff (
    firstname, lastname, email, username, passwd, 
    isadmin, isactive, created, updated
)
VALUES (
    'Admin', 'Support', 'TENANT_EMAIL', 'admin',
    MD5(CONCAT('RANDOM_SALT', MD5('RANDOM_PASSWORD'))),
    1, 1, NOW(), NOW()
);
```
- Store the password encrypted in `DfTenantConfigs.MySqlConnectionStringEncrypted`

### 6. Configure osTicket Email (CRITICAL)
Run these SQL updates against the tenant's MySQL database:

```sql
-- Outbound email (Brevo SMTP)
UPDATE ost_config SET value = 'TENANT_SUPPORT_EMAIL' WHERE namespace = 'core' AND `key` = 'default_email';
UPDATE ost_config SET value = 'TENANT_BUSINESS_NAME Support' WHERE namespace = 'core' AND `key` = 'default_name';

-- Insert outbound email account
INSERT INTO ost_email (
    dept_id, topic_id, priority_id, flags,
    email, name, updated, created
)
VALUES (
    1, 0, 0, 0,
    'TENANT_SUPPORT_EMAIL', 'TENANT_BUSINESS_NAME Support',
    NOW(), NOW()
);

-- Insert SMTP settings
INSERT INTO ost_email_account (
    email_id, smtp_host, smtp_port, smtp_user, smtp_passwd,
    smtp_tls, smtp_auth, updated, created
)
VALUES (
    LAST_INSERT_ID(),
    'smtp-relay.brevo.com', 587,
    'BREVO_SMTP_USER', 'BREVO_SMTP_KEY',
    1, 1, NOW(), NOW()
);

-- Set system default email
UPDATE ost_config SET value = LAST_INSERT_ID() WHERE namespace = 'core' AND `key` = 'default_email_id';
```

### 7. Configure Inbound Email Polling
In osTicket admin panel (`/scp/`):
- Go to **Emails** → **Emails** → Add New Email
- Enter tenant's support email address
- Configure IMAP/POP3 settings for the tenant's email provider
- Set fetch frequency to every 5 minutes
- Enable **Auto-Response** for new tickets

### 8. Configure osTicket System Settings
```sql
-- Set site URL (use internal hosting URL, not public)
UPDATE ost_config SET value = 'https://HOSTING_ACCOUNT_URL' WHERE namespace = 'core' AND `key` = 'url';

-- Set helpdesk name
UPDATE ost_config SET value = 'TENANT_BUSINESS_NAME Support' WHERE namespace = 'core' AND `key` = 'helpdesk_title';

-- Disable registration (customers submit via DeskFlow only)
UPDATE ost_config SET value = '0' WHERE namespace = 'core' AND `key` = 'enable_registration';

-- Hide osTicket branding
UPDATE ost_config SET value = '1' WHERE namespace = 'core' AND `key` = 'hide_branding';
```

### 9. Store Credentials in DeskFlow
```sql
UPDATE "DfTenantConfigs"
SET 
    "MySqlHost" = 'MYSQL_HOST',
    "MySqlDatabase" = 'DATABASE_NAME',
    "MySqlConnectionStringEncrypted" = 'ENCRYPTED_CONNECTION_STRING',
    "ProvisioningStatus" = 'pending_activation'
WHERE "TenantId" = 'TENANT_ID';
```

# osTicket Golden Master v1.18.3

## Contents
- `osTicket-v1.18.3.zip` — Clean osTicket installation files
- `seed.sql` — Database schema + default configuration (no tenant data)

## Architecture Notes
osTicket runs as a **hidden background service** — customers never interact with it directly.
All customer-facing interactions go through DeskFlow at `support.gapshop.net`.
osTicket handles email piping, threading, and outbound notifications silently.

## Email Flow

### 10. Activate in Portal Admin
- Go to Portal Admin → DeskFlow → Pending Setup
- Confirm MySQL credentials are saved
- Click **Mark as Ready**
- System sends welcome email to tenant with DeskFlow login URL
- Tenant status updates to Active

## Post-Provisioning Checklist
- [ ] MySQL credentials saved in DfTenantConfigs
- [ ] osTicket email outbound (SMTP) tested
- [ ] osTicket email inbound (IMAP polling) configured and tested
- [ ] Test ticket created via email and visible in DeskFlow
- [ ] Test reply from DeskFlow received by customer email
- [ ] Agent login confirmed at `https://support.gapshop.net/login/{identifier}`
- [ ] Knowledge base confirmed at `https://support.gapshop.net/kb/{identifier}`

## Automation Roadmap (v2)
- SmarterASP.net API → automated hosting account creation
- SmarterASP.net API → automated MySQL database creation
- GitHub API → automated osTicket file deployment via FTP
- SQL seed execution via C# Dapper
- Brevo API → automated SMTP account creation per tenant
- Portal Admin → one-click full provisioning

### 7. Configure Inbound Email (IMAP)
IMAP is required — do not use POP3. IMAP leaves emails on the server after processing, 
providing audit trail and recovery if osTicket misses a poll cycle.

In osTicket admin panel (`/scp/`):
- Go to **Emails** → **Emails** → Add New Email
- Enter tenant's support email address (e.g. `support@tenantdomain.com`)
- Under **Fetching** tab:
  - Protocol: **IMAP**
  - Host: tenant's IMAP server (e.g. `imap.gmail.com`, `outlook.office365.com`)
  - Port: 993
  - Encryption: SSL/TLS
  - Username: full email address
  - Password: app password or IMAP credentials
  - Fetch Frequency: **5 minutes**
  - Archive fetched emails: **Yes** (moves to Archive folder after processing)
- Under **Auto-Response** tab:
  - Enable auto-response on new ticket: **Yes**
  - Use system default email for responses: **Yes**
- Save and click **Test** to verify IMAP connection

**Gmail setup notes:**
- Enable IMAP in Gmail settings
- Use App Password (not account password) if 2FA is enabled
- Allow less secure apps or use OAuth2

**Microsoft 365 / Outlook notes:**
- Use `outlook.office365.com` as IMAP host
- Port 993, SSL/TLS
- Use App Password if MFA is enabled
- May require admin to enable IMAP for the mailbox

**osTicket IMAP SQL configuration:**
```sql
-- Insert inbound IMAP account
INSERT INTO ost_email_account (
    email_id, protocol, host, port,
    username, passwd, tls, can_delete,
    num_failures, updated, created
)
VALUES (
    EMAIL_ID_FROM_STEP_6,
    'IMAP', 'IMAP_HOST', 993,
    'TENANT_EMAIL', 'IMAP_PASSWORD',
    1, 0,
    0, NOW(), NOW()
);
```
