# Terraform IaC

## Init

 - create a `backend.tfvars` file with the following content:

   ```env
   access_key="THE_SCALEWAY_ACCESS_KEY"
   secret_key="THE_SCALEWAY_SECRET_KEY"
   ```

 - create a `secrets.tfvars` file with the following content:

   ```env
   access_key="THE_SCALEWAY_ACCESS_KEY"
   secret_key="THE_SCALEWAY_SECRET_KEY"
   organization_id="YOUR_SCALEWAY_ORGANIZATION_ID"
   project_id="YOUR_SCALEWAY_PROJECT_ID"
   ```
   
 - init terraform by running `terraform init -backend-config=backend.tfvars`

## Apply

  - apply modification to the infrastructure by running `terraform apply -var-file=secrets.tfvars`
  - to destroy the infrastructure, run `terraform destroy -var-file=secrets.tfvars`
