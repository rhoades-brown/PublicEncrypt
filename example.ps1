$PublicKey = @"
-----BEGIN CERTIFICATE-----
MIIFFTCCAv2gAwIBAgIUPYBrWS9b+rLM5Tq5f0SApiL0XUIwDQYJKoZIhvcNAQEL
BQAwGjEYMBYGA1UEAwwPUGFzc3dvcmRDaGFuZ2VyMB4XDTIxMDIyNjIxMzUzNloX
DTIyMTAxOTIxMzUzNlowGjEYMBYGA1UEAwwPUGFzc3dvcmRDaGFuZ2VyMIICIjAN
BgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEArMUSRH2/KZQIQjgOFHZawp6uVnGp
+vrvr/+1soGgvlneV8RDDDiVNCfr6jxP+q6tCUw+PJKgWkGgPSMpiV+28eEL6eKj
7zoBZP7F2Qdo4aA/UhEsmEX+yN6ZIGckFl+S5wSdRYUUrAqOegqHG06gGhFwCer6
0o8vqrF4iw7lINb0YGFQSFEkVYpOWKYRy5jvjyBiMKImwNggxsUImCS2O2o1On4L
xvioPidr1Q6fENvK9mhVyqa1TLFeo2wbPRHJCFZQteaaqfuXfOMqNt9T5HlNy+Bn
rEP8S00pNNHmbVwfD38ufRZ0TQP7RgV3GOF32Bq7o73bQucEd7LqnLw3KISt4tph
9b8b2GhzzWL4KBq9dmKrDNClDhHoHEq1ToMkyrB6YxzhNgoRTS90Z/q1yNxpyl+u
ERePfDEXm7ZXqos9ucRegUBchbvXCgLvGu9uUQi5cQqS+0dJGIwomigd+uzvu4Je
GiBCqYW1SgHUcLD5vZwwmLvGipfcGRw8wBDqDsnMye90Te2Hyk2TEeTNIy2znF53
2kRit6HovmJaVyF9cEkH6E2SR3qx+c6E8IJUWnr3IPuQuURMFpAQYAh6KGD+4Hil
BqOS+OvCBGw0ETK+id74h47Gl6frrbyWPmoSElgC2wXODwjXSWbW9Q7JxR/on6JC
rNl4yWuBnUNhooMCAwEAAaNTMFEwHQYDVR0OBBYEFKg6M79s/6XDk7MHsYr0whg2
NuVRMB8GA1UdIwQYMBaAFKg6M79s/6XDk7MHsYr0whg2NuVRMA8GA1UdEwEB/wQF
MAMBAf8wDQYJKoZIhvcNAQELBQADggIBAJ577wVAmBLlJopiG/7J57NCoRz/SndZ
Q0Cgv51O/dCNn4cDqR5nUHJTrpj8WI0NXKzsc9SBfNXLynZyJ2RmkSkcWf+P50JV
XumntIquO93A+3UJtT7sekUkL2mbed9Hy3C8F6pzNjpu0+zQf72AUSSXMnEqQyTj
mVREJq4ks3OmpSwT81E4IAggFQysZNy+4t+Hbpiom9+cyjfwVaQ+P7xOEOIirxbj
OkXxjsK+ryXaDW3JrzzCS/bmQF3LBLC/RXzz917dgUchrBdRYIT1yN79IEam8NUN
PPU426uTm+mtWRel4M1RB+C5EkaFdl22Wl+RMlxKqaXFAWyHVWM4U6+GspcxDgMi
4ua7tZEdFldpxPrU3CCCK/6plG90zmRrOD6bVCo0LjcsFgMLdsD9u/Q1tZjjT948
SlXiuh8hxp5qDcnMqB1SfxxvUzFJKYNd3k2O/rZ2njThkuPAislmKiUiLptrqe1+
DR2IBobzYEY/grzcXZX/l+WjRmr4+zLQUhTtNOryCn4Z0Lf24ANx+Mcv3V4h1KSD
jg084NViZMps7Z/c+xMHTS6tnY5qOQDvd7NuxHpDn2cMH5dslHwZ4HLmkoU9FvN2
Tihj2PXLhLZIGA/CJqLNj8ahjdWUAhzH7tAJzmROcu6SiAMoQ2X1HOOLhYUuXxqo
MSxDzUy9LPab
-----END CERTIFICATE-----
"@

$result = [ordered]@{
    Original  = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
    Encrypted = ""
    Decrypted = ""
}
$result.Encrypted = $result.Original | ConvertTo-EncryptedString -PublicKey $PublicKey
$result.Decrypted = $result.Encrypted | ConvertFrom-EncryptedString

$result | Format-Table -AutoSize -Wrap