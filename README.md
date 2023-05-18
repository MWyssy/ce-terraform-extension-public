# Terraform continued

This exercise grows your Terraform knowledge, specifically with the [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs), to create further AWS resources.

## Pre-requisites

- Completed the [Intro to Terraform](https://github.com/northcoders/ce-intro-terraform) exercise

## Instructions

### 1. Copy terraform files

This exercise will build upon the previous intro to terraform exercise.

In order to get started we need to make sure the VPC and subnets etc are in place

Copy your **main.tf** (and any other *.tf files) to this directory

**🗒️ Note:** It is on the tf files you need to copy over. You don't need any of the other files such as the terraform lock file or similar - they will be created afresh when you run the terraform commands in here.

### 2. Run terraform apply

Before you get started on creating new resources, its worth making sure that you can apply the terraform config before you change it.

Run `init` followed by `apply` as per below

```
terraform init
```

and then 

```
terraform apply
```

Once it has completed and created your starting infrastructure (VPC and Subnets), it's time to undertake the next step

### 3. The requirements

The goal here is to create an EC2 instance that you can SSH to. 

The SSH instance should go in one of the public subnets you have created.

**🗒️ Note:** For now the instance does not need to be running an application or anything like that - it's simply proving you can SSH to it.

**🗒️ Note:** It is absolutely fine to use Terraform modules if you wish.

In order to complete this you will need to provision/be aware of:

* An internet gateway
* Security groups
* Route tables
* Key/pair for SSH'ing

Also as part of the exercise try to separate your code into separate terraform files such as **igw.tf** for the internet gateway and **sg.tf** for the security groups.

This starts that separation of concerns within your code.

## Tearing things down

You should just be able to run `terraform destroy`

## Submission process

1. Fork this GitHub repository

2. Make regular commits and pushes back to your repository as you write your code. At a minimum commit and push when indicated in the instructions but feel free to commit more often. It help's to see the journey you worked through when completing the task.

3. Share your GitHub link

4. Tear things down as described above
