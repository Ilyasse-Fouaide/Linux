# How to Change Permissions using Absolute Mode

Absolute mode uses numbers to represent permissions and mathematical operators to modify them.

The below table shows how we can assign relevant permissions:

| Permission             | Number |
| ---------------------- | ------ |
| Read permission `r`    | 4      |
| Write permission `w`   | 2      |
| Execute permission `x` | 1      |

The sum of these values is used to set the permission. For example:

* `7`: Read (4) + Write (2) + Execute (1)
* `6`: Read (4) + Write (2)
* `5`: Read (4) + Execute (1)

## Examples:

The basic syntax of the `chmod` command with absolute mode is:

```
chmod xyz file
```

* `x`: Owner's permissions.
* `y`: Group's permissions.
* `z`: Others' permissions.

To give read, write, and execute permissions to the owner, and only read permissions to the group and others:

```
chmod 744 filename
```

To give read and write permissions to the owner, read-only permissions to the group, and no permissions to others:

```
chmod 610 filename
```
