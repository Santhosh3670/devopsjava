# DevOps Practice Mini Project

This project covers a full CI/CD pipeline for a simple Node.js web app using various DevOps tools.

---

## Project Structure

- `app.js` — Simple Node.js express app
- `package.json` — Dependencies and scripts for Node.js app
- `Dockerfile` — To containerize the Node.js app
- `Jenkinsfile` — Declarative Jenkins pipeline script
- `deploy-app.yml` — Ansible playbook to deploy Docker container on a remote server
- `main.tf` — Terraform script to provision an AWS EC2 instance

---

## Steps to Follow

### Step 1: Run the Node.js App Locally
```bash
# Install dependencies
npm install

# Run app
node app.js

# Visit http://localhost:3000 in your browser
```

### Step 2: Build and Run Docker Container Locally
```bash
# Build Docker image
docker build -t devops-practice-app .

# Run Docker container
docker run -p 3000:3000 devops-practice-app

# Visit http://localhost:3000 to see the app
```

### Step 3: Push Code to GitHub
- Initialize git repo and commit all files
- Push to your GitHub repository

### Step 4: Setup Jenkins Pipeline
- Install Jenkins and required plugins (Git, Docker)
- Create credentials for Docker Hub and add to Jenkins
- Create a new pipeline job in Jenkins
- Use the `Jenkinsfile` from this repo
- Configure webhook from GitHub to trigger Jenkins builds on code push

### Step 5: Push Docker Image to Docker Hub
- Docker image will be built and pushed automatically by Jenkins pipeline

### Step 6: Deploy Using Ansible
- Setup Ansible control machine and add your server to `hosts` inventory under `[webservers]`
- Run the playbook to deploy app:
```bash
ansible-playbook -i hosts deploy-app.yml
```

### Step 7: (Optional) Provision EC2 Instance Using Terraform
```bash
terraform init
terraform apply
```

---

## Notes
- Replace placeholders (`your-username`, `dockerhub-credentials-id`) in files with your actual data.
- Make sure Docker, Node.js, Jenkins, Ansible, Terraform are installed and configured properly.
- Use AWS Free Tier for testing cloud resources.

---

Happy DevOps learning! 🚀
