# sambamBench-nf

[![nextflow](https://img.shields.io/badge/nextflow-0.27.6-blue.svg)](https://nextflow.io)

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
