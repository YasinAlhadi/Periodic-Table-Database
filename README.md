<img src="postgresql-original.svg" height="40" width="40"/>  <img src="bash-original.svg" height="40" width="40"/>

# Periodic Table Database

## Description

Bash a script to get information about chemical elements from a periodic table database.

## Usage

### Setup
1. clone the repository:
```bash
$ git clone https://github.com/YasinAlhadi/Periodic-Table-Database.git
```
2. run
```bash
$ psql -U postgres < periodic_table.sql
```
3. to get information about an element:
```bash
$ ./element.sh <element name> or <element symbol> or <atomic number>
```

## Example
<img src="period_ex.png" />

## Technologies:
- PostgreSQL
- Bash