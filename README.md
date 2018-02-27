# sambamBench-nf

A simple [Nextflow](nextflow.io) pipeline for testing the performance of sambamba vs samtools.

## Requirements

- [Nextflow](www.nextflow.io) 0.27.x (or higher)
- Java 8 or higher
- [Docker](www.docker.com) 1.10 (or higher) or Singularity engine

Note: the pipeline can be used without a container engine by installing the required versions of `sambamba` and `samtools` in your system.

## Quickstart

Install nextflow with the following command:

```
curl -fsSL get.nextflow.io | bash
```

Run the pipeline with:

```
nextflow run guigolab/sambamBench-nf
```

```
nextflow 
```
