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
