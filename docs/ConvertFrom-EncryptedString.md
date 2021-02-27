---
external help file: PublicEncrypt-help.xml
Module Name: PublicEncrypt
online version:
schema: 2.0.0
---

# ConvertFrom-EncryptedString

## SYNOPSIS

Converts a string encrypted with ConvertTo-EncryptedString back into a regular string.

## SYNTAX

```
ConvertFrom-EncryptedString [-EncryptedString] <String> [<CommonParameters>]
```

## DESCRIPTION

Provide the string from ConvertTo-EncryptedString and decrypt it with the relevant certificate stored in the key store.

## EXAMPLES

### Example 1

```powershell
PS C:\> ConvertFrom-EncryptedString -EncryptedString "MIICpgYJKoZIhvcNAQcDoIIClzCCApMCAQAxggJOMIICSgIBADAyMBoxGDAWBgNVBAMMD1Bhc3N3b3JkQ2hhbmdlcgIUPYBrWS9b+rLM5Tq5f0SApiL0XUIwDQYJKoZIhvcNAQEBBQAEggIAWWTWhpz3OvLP/NxiLV/MCWyDpToJuavmc6ybYZeCkUg1VU0x1aKCw3BgnKTR+8tGwG6G8c/vRMqdUzpvBaKPl1n8uTL2Uz1vNKrKnQf17e2CXiqYgVhd7DkX9GYD4JCw0fgxym/XF+6YLqEtq/yFOcIiPNx7BmR4Vnu651Jd9oCTMNUSScGZdTef2bD6HV437R3z/FuO50nYFsnFeF35tElLxSwf1G4WdMcp1DhrvmCBPFEutOgOT723+VSIayTCnnD5tiRxYxEzyncVrRfSSl90JsWY4NT6lyZ73+tWlYvSCP6IcjfkvaTzSDYlOyABIIZ3PZeqzh8S0YgFRR21NL2xnBtSoiIZbWzs0O/ip7rHgMDabtgbYdv3dYI5/h/61cB9srEEbbETyr02NApSTBFytw13+2C+d6zNTV0DcDVSggWMz6saAfvUplXSC6u25K9nweJMnqYoRdNgYiHD2QWtN31+ULpCE68+qxibZN/4wyAQQqiFqtGcYKtKqiJkEhrKwXzlm207Qp8EVFT/os/acUNLyLX9/VKGAUDY5dxdh1V4ioqs6hLFZNJ5KxafzzyFQzXUv+uszaPTD2w+abBr2fqtfLCcrGNDz0dmaUb1fbasoG7rTqDzW0cJrSnj6qMgSZPvnbO95yQyA5N7A5rM0ae+coV1ZxCUUDQuPSEwPAYJKoZIhvcNAQcBMB0GCWCGSAFlAwQBKgQQJiKxO6KdNdohnbDj+W5D24AQENKllvfvuFpP7XBGsjq3cg=="
```

Converts the encrypted string.

## PARAMETERS

### -EncryptedString

The encrypted string created using ConvertToEncryptedString.

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
