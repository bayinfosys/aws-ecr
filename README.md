# AWS ECR Terraform Module

Simple module to wrap up the creation and indexing of container
repositories and images in AWS ECR.

## NOTES

+ repositories have a lifecycle defined to retain a set number of images (default: 12)
