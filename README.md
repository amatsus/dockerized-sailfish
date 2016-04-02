# Dockerized Sailfish
[![](https://imagelayers.io/badge/amatsus/sailfish:latest.svg)](https://imagelayers.io/?images=amatsus/sailfish:latest 'Get your own badge on imagelayers.io') [![GPLv3 License](http://img.shields.io/badge/license-GPL_v3-blue.svg?style=flat)](LICENSE)

## Usage

```
$ docker run --rm -v $PWD:$PWD -w $PWD amatsus/sailfish index -t <ref_transcripts> -o <out_dir> -k <kmer_len>
```
<p>
See [github.com/kingsfordgroup/sailfish](https://github.com/kingsfordgroup/sailfish) for more details.
