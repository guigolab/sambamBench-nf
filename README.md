# sambamBench-nf

[![nextflow](https://img.shields.io/badge/nextflow-%E2%89%A50.27.6-blue.svg)](https://nextflow.io)

A simple Nextflow pipeline for testing the performance of sambamba vs samtools.

## Requirements

- [Nextflow](https://nextflow.io) 0.27.x (or higher)
- Java 8 or higher
- [Docker](https://www.docker.com) 1.10 (or higher) or Singularity engine

Note: the pipeline can be used without a container engine by installing the required versions of `sambamba` and `samtools` in your system.

## Quickstart

Install Nextflow with the following command:

```
curl -fsSL get.nextflow.io | bash
```

Run the pipeline with:

```
nextflow run guigolab/sambamBench-nf
```

Note: the command above will automatically download a test BAM file of ~4GB in `./data` if the file is not present.

Check the [Makefile](Makefile) for more commands.

The [Nextflow config](nextflow.config) file contains the pipeline configuration including parameters and resource specifications.

A sample report of a run in the [CRG](http://www.crg.eu/) cluster on a single node with `16` cpus and `120G` of memory can be seen [here](https://guigolab.github.io/sambamBench-nf/report_16_120G.html) 