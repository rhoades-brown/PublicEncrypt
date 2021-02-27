---
external help file: PublicEncrypt-help.xml
Module Name: PublicEncrypt
online version: https://github.com/rhoades-brown/PublicEncrypt/blob/main/docs/ConvertTo-EncryptedString.md
schema: 2.0.0
---

# ConvertTo-EncryptedString

## SYNOPSIS

Encrypts a string using a public key certificate.

## SYNTAX

```
ConvertTo-EncryptedString [-String] <String> [-PublicKey] <String> [<CommonParameters>]
```

## DESCRIPTION

Pass a string and a public key and return an encrypted version of that key.

## EXAMPLES

### Example 1

```powershell
PS C:\> ConvertTo-EncryptedString -String "This is a string" -PublicKey $PublicKey
```

Encrypts the string using a public key.

## PARAMETERS

### -PublicKey

A string representation of a public key.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -String

The string to encrypt.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
