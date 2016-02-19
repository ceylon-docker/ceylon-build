# Building Ceylon ZIP releases

The following images/tags are available:

 - `latest` ([ceylon-build/Dockerfile](https://github.com/ceylon-docker/ceylon-build/blob/master/Dockerfile))

To run the build perform the following steps:

 1. `docker pull ceylon/ceylon-build:latest`
 2. Create a folder for the build output, eg: `mkdir /tmp/ceylon`
 3. Determine which Ceylon version you want to build (eg. `1.2.1`) and use that in place of the `VERSION` argument below in step 4
 4. `docker run -t --rm -v /tmp/ceylon:/output ceylon/ceylon-build:latest VERSION`

If the build completed successfully the resulting ZIP file can be found in `/tmp/ceylon`.

NB: You can of course use a different output folder than the `/tmp/ceylon` used in the example but you *have* to use it's full path in the command!

