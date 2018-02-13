// Create input file object
bam = file(params.bam)

// Download input file if does not exist
if (bam instanceof Path && !bam.exists()) {
    getUrl = "${params.baseUrl}/${bam.name}"
    log.info("Downloading $getUrl")
    file(getUrl).copyTo(bam)
}

// Channel.fromPath(bams)
// .set{bam}

sambambaVers = params.sambambaVers.tokenize(',')
samtoolsVers = params.samtoolsVers.tokenize(',')

commands = ['flagstat', 'index', 'markdup', 'sort', 'view' ]

samtoolsDiffCommands = ['flagstat', 'index', 'markdup']

process sambamba {
    
    input:
    each command from commands
    each ver from sambambaVers
    file bam from bam

    output:
    file ".command.err"

    script:
    mem = (task.memory.toBytes()*0.6) as long
    template "${command}/${task.process}"
}

process samtools {

    input:
    each command from commands
    each ver from samtoolsVers
    file bam from bam

    output:
    file ".command.err"

    script:
    mem = (task.memory.toBytes()*0.6/task.cpus) as long
    verSuffix = samtoolsDiffCommands.contains(command) ? "-${ver}" : ""
    
    template "${command}/${task.process}${verSuffix}"
}
