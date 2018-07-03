# BendersSCIP
The Benders' decomposition framework for the SCIP Optimisation Suite

This is a repository of the source files that make up the Benders' decomposition framework in SCIP. These sources files are provided here so that any recent developments to the framework are immediately available. This provides early access to updates to the Benders' decomposition framework for SCIP between releases.

Note that since this code represents the most recent developments, it is possible that bugs are present. Using the updated code may introduce bugs into your current SCIP distribution.

In order to use the source code available in this repository, you must have a version of SCIP available. You can download SCIP from [download](http://scip.zib.de/#download).

## Using this repository

This repository provides a helper script to sync the source code in the repository with that in your SCIP 6.0 distribution. You can update the Benders' decomposition framework in your SCIP 6.0 distribution by calling the script

```
sync_with_scip.sh <your/scip/directory> <benders source files>
```

The *benders source files* are listed in the file `benders_files`. This contains the directory paths to the Benders' decomposition source files in the SCIP 6.0 distribution.

Before performing the sync, it is advised that you back up your SCIP 6.0 distribution in version control.

It is also possible to sync the files from the SCIP 6.0 source directory to BendersSCIP. This is achieve by providing the `-u` flag to the `sync_with_scip.sh` script.
