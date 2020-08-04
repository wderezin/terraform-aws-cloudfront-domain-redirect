# Terraform AWS Cloudfront Domain Redirect

A [Daring Way](https://www/daringway.com/) opinionated approach on how to create a cloudfront redirector from an apex domain to www. (daringway.com -> www.daringway.com)

    Contestant: AWS for $600.
    Alex: How you easily configure AWS Cloudfront to domain redirection?
    Contestant: What is the Daring Way AWS Cloudfront Domain Redirect Terraform Module.
    Alex: That is correct.
    
# Usage

```hcl
module cloudfront_domain_redirect {
  source = "daringway/cloudfront-domain-redirect/aws"
  tags   = {}
}

resource aws_cloudfront_distribution a_distribution {
 
   ...

   lambda_function_association {
      event_type   = "viewer-request"
      lambda_arn   = module.cloudfront_domain_redirect.qualified_arn
      include_body = false
  }

  ...
}
```    
    
[Semantic Version](https://semver.org) is being applied to the modules. 

1. MAJOR version requires a change. 
    - upgrading to new version of terraform
    - variable name changes
    - new variable without a default value
    - changes that will require manually updating the terraform.tfstate file such as a `terraform state mv`
    - changes that will require resources being destroy and created that require external terraform application configuration
2. MINOR version add new functionality in a backwards compatible manner
    - new variable with default value
3. PATCH version have backwards compatible bug fixes