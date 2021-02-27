---
Module Name: PublicEncrypt
Module Guid: 32fa175a-f5f2-47ca-95af-5277827b79d4
Download Help Link: https://github.com/rhoades-brown/PublicEncrypt/blob/main/docs/PublicEncrypt.md
Help Version: 1.0.0
Locale: en-US
---

# PublicEncrypt Module

## Description

This PowerShell contains two functions, one to encrypt a string using a public key that is provided, and another which decrypts the string using a certificate containing the the private key installed in the keystore.

## PublicEncrypt Cmdlets

### [ConvertFrom-EncryptedString](ConvertFrom-EncryptedString.md)

Converts a string encrypted with ConvertTo-EncryptedString back into a regular string.

Provide the string from ConvertTo-EncryptedString and decrypt it with the relevant certificate stored in the key store.

### [ConvertTo-EncryptedString](ConvertTo-EncryptedString.md)

Encrypts a string using a public key certificate.
Pass a string and a public key and return an encrypted version of that key.
