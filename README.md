# check_x509

`check_x509` is a script to check the validity of various x509 entities.
Currently it checks certificates and CRLs for expiration. In the future it'll
likely check for valid CA signatures and other things.

`check_x509` was written to fit in well with nagios/nrpe and similar monitoring
infrastructures, but also to be an easy-to-use command line utility for
checking x509 entities as well as for easy use in cron or other scripts.

## Usage
Your best bet is to read the POD documentation and the --help option, but the
simple invocations are:

```
check_x509 --certificate /path/to/cert.crt --cert-form PEM --warn 4w \
  --crit 2w -v
```

Notice the `-v` option. It's the most useful way to run it interactively, but is
too noisy when being used as a plugin to something like Nagios. Another
example would be:

```
check_x509 --crl /path/to/crl.crt --crl-form DER --warn 4w --crit 2w -v
```

To check a CRL instead of a certificate.

`check_x509` also supports bundles of PEM-encoded certificates or CRLs.

## Config file
`check_x509`'s configuration file is YAML. I find YAML to be great for config
files because it's a natural way to represent arbitrary hierarchical data. It
does take a few minutes to get used to, but the quick version is:

* key-values are:
```
foo: var
```

* arrays are:
```
- foo
- var
```

* hashes are:
```
something:
  foo: bar
  baz: bat
```

As you can see, nesting is trivial. If you don't understand, don't worry,
is a complete example config file included in the distribution to help you.

`check_x509` attempts to be a one-stop shop for checking all X509 entities on a
box in one step (if you want it to be). In order to do that right, that means
`check_x509` supports per-entity thresholds.

## A note on bundles
`check_x509` handles bundles of both certificates and CRLs. This is useful for
bundles that apache, openssl, or other software may need. When handling this,
`check_x509` will check each entity in the bundle and report on the bundle as a
whole. In verbose mode, the expiration for each object in the bundle will be
printed, but only the most sever status is actually used.

- Phil Dibowitz <phil@ipom.com>
http://www.phildev.net/check_x509/
