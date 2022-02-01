# AWS ECR Terraform Module

Simple module to wrap up the creation and indexing of container
repositories and images in AWS ECR.

## NOTES

+ repositories have a lifecycle defined to retain a set number of images (default: 12)
+ outputs contain an access key id and secret to push containers to the repositories
    + `pusher_access_key_id`
    + `pusher_access_key_secret`
    + use these values in automation to push images to the repos

# TODO

make the `pusher` IAM optional
