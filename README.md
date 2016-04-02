# Dockerized Sailfish
[![](https://badge.imagelayers.io/amatsus/sailfish:0.6.3.svg)](https://imagelayers.io/?images=amatsus/sailfish:0.6.3 'Get your own badge on imagelayers.io') [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

## Usage

```
$ docker run --rm -v $PWD:$PWD -w $PWD amatsus/sailfish index -t <ref_transcripts> -o <out_dir> -k <kmer_len>
```
<p>
See [github.com/kingsfordgroup/sailfish](https://github.com/kingsfordgroup/sailfish) for more details.
