# Terraform IaC

## Init

 - create a `backend.tfvars` file with the following content:

   ```env
   access_key = "YOUR_SCALEWAY_ACCESS_KEY"
   secret_key = "YOUR_SCALEWAY_SECRET_KEY"
   ```

 - create a `secrets.tfvars` file with the following content:

   ```env
   scaleway_access_key                       = "YOUR_SCALEWAY_ACCESS_KEY"
   scaleway_secret_key                       = "YOUR_SCALEWAY_SECRET_KEY"
   organization_id                           = "YOUR_SCALEWAY_ORGANIZATION_ID"
   project_id                                = "YOUR_SCALEWAY_PROJECT_ID"
   godaddy_key                               = "YOUR_GODADDY_API_KEY"
   godaddy_secret                            = "YOUR_GODADDY_API_SECRET"
   _github-challenge-letsschoolcentral-org   = "YOUR_GITHUB_CHALLENGE_TOKEN"
   _github-pages-challenge-letsschoolcentral = "YOUR_GITHUB_PAGES_CHALLENGE_TOKEN"
   ```
   
 - init terraform by running `terraform init -backend-config=backend.tfvars`

## Apply

  - apply modification to the infrastructure by running `terraform apply -var-file=secrets.tfvars`
  - to destroy the infrastructure, run `terraform destroy -var-file=secrets.tfvars`
