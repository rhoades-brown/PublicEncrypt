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

```
openssl req -x509 -newkey rsa:4096 -sha256 -keyout private.key -out public.crt -subj "/CN=SubjectName" -days 1095
openssl pkcs12 -export -name "Certificate Purpose" -out Private.pfx -inkey private.key -in public.crt
```

Run each command in turn (you cannot copy/paste both lines together as the first one requests input).

- You must specify a PEM pass phrase when creating the key and cert in step 1.
- You must use that same PEM pass phrase for the private key in step 2.
- It is not necessary, but highly recommended to specify an export password in step 2, this prevents the private certificate from being imported into a certificate store without knowing the password.

```
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

### Encoding Data on The Client

### Decoding Data
