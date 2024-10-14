# Installing and upgrading MongoDB in Linux

Installing MongoDB on a Linux system can vary slightly depending on your distribution. Here’s a step-by-step guide for installing MongoDB on Ubuntu. If you're using a different distribution, let me know!

### Step 1: Import the Public Key
Open a terminal and run the following command to import the MongoDB public GPG key:

```bash
wget -qO - https://www.mongodb.org/static/pgp/server-8.0.asc | sudo apt-key add -
```

### Step 2: Create the List File for MongoDB
Next, create a list file for MongoDB. For Ubuntu 20.04 or 22.04, run:

```bash
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
```

If you're using a different version of Ubuntu, replace `focal` with `jammy` for 22.10 or `bionic` for 18.04.

### Step 3: Update the Package Database
Update your package database to include the MongoDB packages:

```bash
sudo apt update
```

### Step 4: Install MongoDB
Install MongoDB with the following command:

```bash
sudo apt install -y mongodb-org
```

### Step 5: Start MongoDB
Once the installation is complete, start the MongoDB service:

```bash
sudo systemctl start mongod
```

### Step 6: Enable MongoDB to Start on Boot
To ensure MongoDB starts on boot, run:

```bash
sudo systemctl enable mongod
```

### Step 7: Verify the Installation
Check if MongoDB is running by checking its status:

```bash
sudo systemctl status mongod
```

You should see active (running) in the output.

### Step 8: Connect to MongoDB
You can connect to the MongoDB shell by running:

```bash
mongosh
```

### Optional Step: Configure Firewall
If you have a firewall enabled, you might want to allow connections on MongoDB's default port (27017):

```bash
sudo ufw allow 27017
```

## Upgrading

Upgrading MongoDB on Ubuntu (or any Linux system) involves a few steps. Here’s how to upgrade MongoDB on Ubuntu 22.04 (Jammy):

### Step 1: Backup Your Data
Before performing any upgrade, it's crucial to back up your data. You can use `mongodump` for this:

```bash
mongodump --out /path/to/backup/directory
```

### Step 2: Update the Package List
Open your terminal and run the following command to update your package list:

```bash
sudo apt update
```

### Step 3: Install the Latest Version
To upgrade to the latest version of MongoDB, run:

```bash
sudo apt install -y mongodb-org
```

This command will upgrade your existing MongoDB installation to the latest available version from the repository.

### Step 4: Restart MongoDB
After upgrading, restart the MongoDB service:

```bash
sudo systemctl restart mongod
```

### Step 5: Verify the Upgrade
Check the version of MongoDB to ensure it has been upgraded:

```bash
mongosh --eval 'db.version()'
```

### Step 6: Check MongoDB Status
Verify that MongoDB is running correctly:

```bash
sudo systemctl status mongod
```

### Conclusion
You should now have successfully upgraded MongoDB on your Ubuntu system! If you encounter any issues or have questions, feel free to ask.