// Create input file object
bam = file(params.bam)

// Download input file if does not exist
if (bam instanceof Path && !bam.exists()) {
    getUrl = "${params.baseUrl}/${bam.name}"
    log.info("Downloading $getUrl")
    file(getUrl).copyTo(bam)
}

process flagstat {
    
    input:
    each tool from params.tools
    file bam from bam

    output:
    file ".command.err"

    script:
    verSuffix = tool.name == 'samtools' ? "-${tool.version}" : ""
    template "${task.process}/${tool.name}${verSuffix}"
}

process index {
    
    input:
    each tool from params.tools
    file bam from bam

    output:
    file ".command.err"

    script:
    verSuffix = tool.name == 'samtools' ? "-${tool.version}" : ""
    template "${task.process}/${tool.name}${verSuffix}"
}

process markdup {
    
    input:
    each tool from params.tools
    file bam from bam

    output:
    file ".command.err"

    script:
    verSuffix = tool.name == 'samtools' ? "-${tool.version}" : ""
    mem = (task.memory.toBytes()*0.6) as long
    if (tool.name == 'samtools') {
        mem = mem/task.cpus as long
    }
    template "${task.process}/${tool.name}${verSuffix}"
}

process sort {
    
    input:
    each tool from params.tools
    file bam from bam

    output:
    file ".command.err"

    script:
    mem = (task.memory.toBytes()*0.6) as long
    if (tool.name == 'samtools') {
        mem = mem/task.cpus as long
    }
    template "${task.process}/${tool.name}"
}

process view {
    
    input:
    each tool from params.tools
    file bam from bam

    output:
    file ".command.err"

    script:
    template "${task.process}/${tool.name}"
}
