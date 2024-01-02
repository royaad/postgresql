# PostgreSQL

## Installation

### Windows

1. Download the installer from [PostgreSQL.org](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) and install PostgreSQL along with pgAdmin.
2. After installation, go to Windows, then Settings, and search for "system variables" and click on "Edit the system environment variables".
3. In "System Properties", click on "Environment Variables...".
4. In "Environment Variables", under "System Variables", look for "Path", and click on "Edit...".
5. In "Edit Environment Variables", click "New", and copy-paste the Postgres bin path, In my case `C:\Program Files\PostgreSQL\16\bin`.
6. Click "OK" to save changes. Exit "Settings". Go to "Command Prompt" or "PowerShell" and type `psql --help` to check if all is fine.

## Basic psql CLI commands

- To connect to Postgres from PowerShell, type:

```powershell
psql -h localhost -p 5432 -U postgres test
```

In the CLI, type:

- `help` for a list of basic commands.
- `\h` for help with SQL commands and `\?` for help with psql commands.
- `\q` to quit.
- `\l` to list databases.
- `\d` to list tables, views, and sequences.
- `\dt` to list tables and `\ds` to list sequences.
- `\c {DBNAME}` to connect to new database.
- `\x` to toggle expanded output.
- `\i FILE` to execute commands from file.
- `\copy ...` to perform SQL COPY with data stream to the client host. Example:

```sql
\copy (SELECT * FROM employee LEFT JOIN vehicle ON employee.car_id = vehicle.id) TO '/Users/user/Desktop/MOOCs/
PostgreSQL/data/export.csv' DELIMITER ',' CSV HEADER;
```
