# Terraform Portfolio Project

This project deploys a static Next.js portfolio website on AWS using Terraform.

## Architecture

![Architecture Diagram](Architecture.png)

# Technologies Used

- Next.js
- Terraform
- AWS S3
- AWS CloudFront
- AWS CLI
- GitHub

# Project Goals

- Deploy a static Next.js website to AWS
- Use Terraform for Infrastructure as Code
- Configure S3 static website hosting
- Add CloudFront for global delivery and HTTPS
- Store all project files in GitHub

# Deployment Summary

1. Created a Next.js application 
2. Configured static export using `output: "export"`
3. Built the project using `npm run build`
4. Created AWS infrastructure using Terraform
5. Uploaded the `out` folder to S3 using AWS CLI
6. Distributed the website globally using CloudFront

# Live Website

CloudFront URL: https://d19y7jlapazm52.cloudfront.net

# Loom Video

Coming sooon 