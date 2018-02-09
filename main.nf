Channel.fromPath(params.bams)
.into{samtoolsBams; sambambaBams}

sambambaVers = params.sambambaVers.tokenize(',')
samtoolsVers = params.samtoolsVers.tokenize(',')

commands = ['flagstat', 'index', 'markdup', 'sort', 'view' ]

samtoolsDiffCommands = ['flagstat', 'index', 'markdup']

process sambamba {
    
    input:
    each command from commands
    each ver from sambambaVers
    file bam from sambambaBams

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
    file bam from samtoolsBams

    output:
    file ".command.err"

    script:
    mem = (task.memory.toBytes()*0.6/task.cpus) as long
    verSuffix = samtoolsDiffCommands.contains(command) ? "-${ver}" : ""
    
    template "${command}/${task.process}${verSuffix}"
}
