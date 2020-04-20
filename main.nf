//params.infile = "$baseDir/bin/user-settings.mkfg"
params.infile = "gs://GCP-PROJECT-BUCKET/user-settings.mkfg"
inputFile = file(params.infile)

process downloadSRAdataFromCloud {
    
    container = "snamburi3/sratoolkit:2.10.5"
    containerOptions = ''
    stageInMode = 'copy'
    scratch = true

    input:
    file inFile from inputFile
   
    output:
    stdout result
    // file '*.fastq.gz' into reads
 
    script:
    """
    mkdir -p /root/.ncbi
    cp ${inFile} /root/.ncbi/user-settings.mkfg
     
    srapath SRR000001

    # fastq-dump
    # fastq-dump SRR000001 
    """
}
workflow.onComplete {
	log.info ( workflow.success ? "\nDone! srapath: $result\n" : "Oops .. something went wrong" )
}
