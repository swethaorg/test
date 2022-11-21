/**************************************************
 Creating Composer for Prod Env
***************************************************/
module "khg-dev-comp-us-01" {
  source            = ""
  project_name      = "khg-prj-dev-gmc-deg-use4"
  composer_name     = "khcmc-dev-composer"
  region            = "us-east4"

  node_count = 8

      zone                     = "us-east4-b"
      composer_machine_type    = "n2-standard-8"
      network_name             = "projects/khg-prj-gmc-dev-host-vpc-us-01/global/networks/khg-vpc-dev-trust-ss-us-01"
      subnetwork_name          = "projects/khg-prj-gmc-dev-host-vpc-us-01/regions/us-east4/subnetworks/khg-sne-gmc-dev-deg-use4-01"
      composer_service_account = "khg-sac-de-dev-us4@khg-prj-dev-gmc-deg-use4.iam.gserviceaccount.com"
      
        composer_ip_aliases              = true
        composer_pod_range_name          = "khg-sne-gmc-dev-deg-use4-gke-pod-01"
        composer_service_range_name      = "khg-sne-gmc-dev-deg-use4-gke-ser-01"

      database_machine_type     = "db-n1-standard-2"

      web_server_machine_type   = "composer-n1-webserver-8"

      composer_private_endpoint   = true
      composer_sql_ip             = "10.252.222.0/24"
      composer_webserver_ip       = "10.252.221.64/26"
      composer_master_ip_GKE      = "10.252.221.0/26"
      
      airflow_config_overrides = {
        secrets-backend = "airflow.providers.google.cloud.secrets.secret_manager.CloudSecretManagerBackend",
        api-auth_backend = "airflow.api.auth.backend.default"
      }
      env_variables      ={
        COMPOSER_ENV = "dev"
      }
      image_version      = "composer-1.17.8-airflow-2.1.4"
      pypi_packages = {
        google-cloud-bigquery  = ""
        google-cloud-storage   = ""
        google-cloud-firestore = ""
        google-cloud           = ""
        xmltodict              = ""
        pysftp                 = ""
        ndjson                 = ""
        google-cloud-secret-manager = ""
      }
      python_version     = "3"
}