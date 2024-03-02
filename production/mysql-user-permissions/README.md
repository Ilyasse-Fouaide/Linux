# How To Create a New User and Grant Permissions in MySQL

## Creating a New User

Upon installation, MySQL creates a root user account which you can use to manage your database. This user has full privileges over the MySQL server, meaning it has complete control over every database, table, user, and so on. Because of this, it’s best to avoid using this account outside of administrative functions. This step outlines how to use the root MySQL user to create a new user account and grant it privileges.

```bah
sudo mysql
```

Once you have access to the MySQL prompt, you can create a new user with a `CREATE USER` statement. These follow this general syntax:

```mysql
CREATE USER 'ilyasse'@'localhost' IDENTIFIED BY 'password';
```

After creating your new user, you can grant them the appropriate privileges.

## Granting a User Permissions

The general syntax for granting user privileges is as follows:

```mysql
GRANT [PRIVILEGE] ON [database].[table] TO 'username'@'host';
```

Run this GRANT statement, replacing ilyasse with your own MySQL user’s name, to grant these privileges to your user:

```mysql
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'ilyasse'@'localhost' WITH GRANT OPTION;
```

> [!CAUTION]  
> Some users may want to grant their MySQL user the ALL PRIVILEGES privilege, which will provide them with broad superuser privileges akin to the root user’s privileges, like so:
>
> ```mysql
> GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
> ```
>
> Such broad privileges **should not be granted lightly**, as anyone with access to this MySQL user will have complete control over every database on the server.

Many guides suggest running the FLUSH PRIVILEGES command immediately after a CREATE USER or GRANT statement in order to reload the grant tables to ensure that the new privileges are put into effect:

```mysql
FLUSH PRIVILEGES;
```

If you need to revoke a permission, the structure is almost identical to granting it:

```mysql
REVOKE type_of_permission ON database_name.table_name FROM 'username'@'host';
```

You can review a user’s current permissions by running the SHOW GRANTS command:

```mysql
SHOW GRANTS FOR 'username'@'host';
```

Just as you can delete databases with DROP, you can use DROP to delete a user:

```mysql
DROP USER 'username'@'localhost';
```

After creating your MySQL user and granting them privileges, you can exit the MySQL client:

```mysql
exit
```

In the future, to log in as your new MySQL user, you’d use a command like the following:

```mysql
mysql -u ilyasse -p
```

The `-p` flag will cause the MySQL client to prompt you for your MySQL user’s password in order to authenticate.
