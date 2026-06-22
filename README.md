# Terraform Portfolio Project

This project demonstrates how to deploy a static Next.js portfolio website to AWS using Infrastructure as Code (IaC) with Terraform.

The website is hosted on Amazon S3, distributed globally through Amazon CloudFront, and managed entirely with Terraform.

## Architecture

![Architecture Diagram](Architecture.png)

# Technologies Used

- Next.js
- Terraform
- AWS S3
- AWS CloudFront
- AWS CLI
- GitHub

# Infrastructure Created

Terraform provisions the following AWS resources:

- Amazon S3 Bucket
- S3 Website Configuration
- Bucket Ownership Controls
- Public Access Configuration
- Bucket Policy
- Amazon CloudFront Distribution

# Deployment Summary

1. Created a Next.js application 
2. Configured static export using `output: "export"`
3. Built the project using `npm run build`
4. Created AWS infrastructure using Terraform
5. Uploaded the `out` folder to S3 using AWS CLI
6. Distributed the website globally using CloudFront

# Live Website

CloudFront URL: https://d19y7jlapazm52.cloudfront.net

# What I Learned

Throughout this project I gained hands-on experience with:

- Infrastructure as Code (Terraform)
- Amazon S3 Static Website Hosting
- Amazon CloudFront
- Terraform state management
- AWS CLI
- Git and GitHub workflows
- Deploying static Next.js applications

# Loom Walkthrough

A walkthrough explaining the project architecture, Terraform configuration, and AWS deployment will be added here.