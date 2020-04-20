## Download SRA files in the Cloud

## To run:

### Locally (Docker)
```
nextflow run sratools/main.nf -profile docker -w results-local 
```

### GCP
```
export NXF_VER=20.01.0-edge
export NXF_MODE=google
export GOOGLE_APPLICATION_CREDENTIALS=service-account-key.json
nextflow run sratools/main.nf -profile gls 
```

### AWS
```
nextflow run sratools/main.nf -profile awsbatch -w results-aws
```

## Configuring SRAtoolkit
You need to run `vdb-config --interactive` to configure the Sratoolkit. As it is not a good practice to commit credentials to github, dockerhub or any public repository, this example tries to bypass the interactive mode. The approach here is to run `vdb-config --interactive` once and use the `user-settings.mkfg` file generated in the ~/.ncbi directory (or /root/.ncbi directory). You need to provide the `user-setting.mkfg` in this nexflow example. You can store this file locally or in the cloud and provide the path with the `params.infile` variable.

>> you should not share configuration files in GitHub or any public repositories.

## References
1. [Download SRA sequence data using Amazon Web Services (AWS)](https://www.ncbi.nlm.nih.gov/sra/docs/sra-aws-download/)
2. [Setting-up an instance on Google Cloud Platform (GCP)](https://www.ncbi.nlm.nih.gov/sra/docs/SRA-Google-Cloud/)

