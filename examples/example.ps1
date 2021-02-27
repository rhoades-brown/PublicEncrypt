# Get the public key as a single string, or store it in the script as a herestring.
# The password to the private key and the certificate in the examples folder is 'test'.

$PublicKey = (Get-Content -Path ".\public.crt") -join "" # join because it is multi-line.

# Please ensure your have imported Private.pfx

$result = [ordered]@{
    Original  = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
    Encrypted = ""
    Decrypted = ""
}

Import-Module .\Modules\PublicEncrypt

$result.Encrypted = $result.Original | ConvertTo-EncryptedString -PublicKey $PublicKey # pass in the string and the
$result.Decrypted = $result.Encrypted | ConvertFrom-EncryptedString # The public key must already be present, otherwise you get back garbage.

$result | Format-Table -AutoSize -Wrap
