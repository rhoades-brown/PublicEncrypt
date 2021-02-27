# Public Encrypt

A module to encrypt and decrypt a using public &amp; public keys respectively.

## Table of contents

1. [Introduction](#Introduction)
2. [How To Use This Module](#how-to-use-this-module)
   - [Installation](#installation)
   - [Generate a Public & Private Key](#generate-a-public--private-key)
   - [Encoding data on the client](#encoding-data-on-the-client)
   - [Decoding Data](#decoding-data)

## Introduction

This PowerShell contains two functions, one to encrypt a string using a public key that is provided, and another which decrypts the string using a certificate containing the the private key installed in the keystore.

## How To Use This Module

### Installation

### Generate a Public & Private Key

I am using openssl to do this in wsl (for convenience).

```shell
openssl req -x509 -newkey rsa:4096 -sha256 -keyout private.key -out public.crt -subj "/CN=SubjectName" -days 1095
openssl pkcs12 -export -name "Certificate Purpose" -out Private.pfx -inkey private.key -in public.crt
```

Run each command in turn (you cannot copy/paste both lines together as the first one requests input).

- You must specify a PEM pass phrase when creating the key and cert in step 1.
- You must use that same PEM pass phrase for the private key in step 2.
- It is not necessary, but highly recommended to specify an export password in step 2, this prevents the private certificate from being imported into a certificate store without knowing the password.

```shell
mark@WSL:/cert$ openssl req -x509 -newkey rsa:4096 -sha256 -keyout private.key -out public.crt -subj "/CN=SubjectName" -days 1095
Generating a RSA private key
.......................................................................................++++
......................................................................................................................................++++
writing new private key to 'private.key'
Enter PEM pass phrase:
Verifying - Enter PEM pass phrase:
-----
mark@WSL:/cert$ openssl pkcs12 -export -name "Certificate Purpose" -out Private.pfx -inkey private.key -in public.crt
Enter pass phrase for private.key:
Enter Export Password:
Verifying - Enter Export Password:
mark@WSL:/cert$
```

In Windows, open the 'Private.pfx' file. Follow the prompts to import the certificate. By default, it will import into the personal certificate store.

You can check that the certificate is installed in PowerShell:

```powershell
Get-ChildItem -Path Cert:\CurrentUser\My
```

### Encoding Data on The Client

1. Read the private key:

   ```powershell
   $PublicKey = (Get-Content -Path ".\public.crt") -join ""
   ```

   or:

   ```powershell
   $PublicKey = @"
   -----BEGIN CERTIFICATE-----
   MIIFDTCCAvWgAwIBAgIUOedp0TYx26zAByIpfukrhz3Hy+swDQYJKoZIhvcNAQEL
   BQAwFjEUMBIGA1UEAwwLU3ViamVjdE5hbWUwHhcNMjEwMjI3MjAzMjE4WhcNMjQw
   MjI3MjAzMjE4WjAWMRQwEgYDVQQDDAtTdWJqZWN0TmFtZTCCAiIwDQYJKoZIhvcN
   AQEBBQADggIPADCCAgoCggIBAKVfQAy04KT7M1MyCJGTtbD7UL7AwEpoRPDcgTdD
   vqr+iSr64VBclB1dUU1XtYlSNBFk0PJHeFrjfmRegZDdxFUeUih2fu+szg04oU/O
   dT4+rrauRl6Lm//OsxHILLQ4SEXNGSYp7OM7nxaC+rKe4234zg0ddAAeQlT4bksJ
   PlD+FRGMTahtoF+lULdD1vjdf8KtF5mpA16HknQy6ixTwejwk15b/u+ovxCkZuOo
   ukGsYDA4kx5D4d8tiOIeovlPa72LVns/p8Wn/ziXYa56nWBtn2WBvkM46LYNlKQG
   aHKN9iY/ruxyrtsuUXbsGcK9v9s64JwF8REJ5tpOGZDWz20duVMoBlg8hd3QWBea
   +FEdW9PfFWXSY43cz0FeOgu8vpUQ63CYdovRoTMn2LevobVw1Uk/wSc6e6Ml0bWA
   U/jUlx+eqs736BCG0Yu6wFRPkpTeSZyofNeTNgUc2+dz8f76JsGRRYS2qG1Iz1PL
   XNdE5G0fEgBaUsd13bNOD7xCV/N2funhfP9NsJ3utIfz6QwAWslNgjTc/73ShQsS
   7B4xt9K7wF5E4oWe/cPDbnVOwVKzbLgrnpQvH1CsVytHUdiDwNzSL5wVHSIeDc6X
   r9HmkPWWTP9pocAOVnu7IVsz2h8qDYgtfVW9Em1kB5DFQd2mGZbEEidrCL0r82u9
   jMsRAgMBAAGjUzBRMB0GA1UdDgQWBBTlETwKffP0fchDMh73j/kdFZ498jAfBgNV
   HSMEGDAWgBTlETwKffP0fchDMh73j/kdFZ498jAPBgNVHRMBAf8EBTADAQH/MA0G
   CSqGSIb3DQEBCwUAA4ICAQCiqz2c8OIA79OjTvq8sGBVnN26DfFgJe1KBNRI4UHh
   6gmfqZLIZ/SonRlVAoQOQzl9JRYmfS/cka7vC5Cm4s0RxSNAUPup/xDPKHWGuaIV
   4fJNxZ7ZlLFpjYHRzHx2njaywKqXwqEkqAJpFhxqE73J9jfkfCMeVmh0snogpjnW
   m7YXibmxhunGmJG5MEI0Xv690hl670zlQ2aI/W0wHOnPRmor13CoSvpLisWTsdAr
   T357bBd/TzttqoNcTUGca47vN9avmjnqXEMRcnpCCkMoq763QjJppBFAkfmpFm1+
   vTXXQEfATrzfP/7gkZoz2TaSM34wsTOe1McGHII92rPPFpB7f2KRhXb06P13FHVg
   H6UY6++JzMIg/Ugm0QCf1fLOYTyUl8JvLK30PFum5SBKB0ilruuxpEQUvZx9sGft
   TKjNiefcvwxUovPA80Xb4FLQb5WXzzuya5G7J95bmnICS5nz29Zkw/+iw8+xz0qS
   0j3P6p/hZzgoPGi9heSjpjWPQJo+twTZ1iN2kAbLtWK2mKyF/CFErhI+/RJmxg6Z
   7BLvavYZFUDYPxSME22bnUWgFScJToJp+rNkUKCSzQKcZI2f3z1nQ71lhTEy4STz
   tim6MyZD/JKnGe7keg6+k8JgVKAgXKPLadjf7Vnq49DHDixTDBTV/QCvxO0BTEXY
   vw==
   -----END CERTIFICATE-----
   "@
   ```

2. Use the public key to encrypt a string:

   ```powershell
   "This is a test string." | ConvertTo-EncryptedString -PublicKey $PublicKey
   ```

### Decoding Data

1. Ensure that the certificate with the private key is imported into the certificate store. On Windows this can be the personal or the computer store.

   ```powershell
   "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" | ConvertFrom-EncryptedString
   ```
