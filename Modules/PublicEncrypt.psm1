function ConvertTo-EncrytpedString {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true
        )][String]$String,

        [Parameter(
            Mandatory = $true,
            Position = 1
        )][String]$PublicKey
    )

    $UTFEncoder = [System.Text.Encoding]::UTF8

    $X509Certificate = New-Object -TypeName System.Security.Cryptography.X509Certificates.X509Certificate2 -ArgumentList @(, $UTFEncoder.GetBytes($PublicKey))

    $Envelope = New-Object -TypeName System.Security.Cryptography.Pkcs.EnvelopedCms -ArgumentList (
        New-Object -TypeName System.Security.Cryptography.Pkcs.ContentInfo -ArgumentList @(, $UTFEncoder.GetBytes($String))
    )

    $Envelope.Encrypt(
        (New-Object -TypeName System.Security.Cryptography.Pkcs.CmsRecipient($X509Certificate))
    )
    
    return [System.Convert]::ToBase64String(
        $Envelope.Encode()
    )
}

function ConvertFrom-EncrytpedString {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true
        )][String]$EncryptedString
    )

    $UTFEncoder = [System.Text.Encoding]::UTF8
    $Envelope = New-Object -TypeName System.Security.Cryptography.Pkcs.EnvelopedCms

    $Envelope.Decode(
        [Convert]::FromBase64String($EncryptedString)
    )
    $Envelope.Decrypt() 

    $UTFEncoder.GetString($Envelope.ContentInfo.Content)
}