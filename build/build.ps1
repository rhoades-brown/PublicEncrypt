$RootPath = Get-Item -Path $PSScriptRoot |
    Select-Object -ExpandProperty PSParentPath

$Modules = Join-Path -Path $RootPath -ChildPath Modules |
    Get-ChildItem

$Modules | ForEach-Object {
    Import-Module $_.FullName -Verbose
}
Update-MarkdownHelp -Path .\docs

$Modules |
    ForEach-Object {
        New-ExternalHelp .\docs -OutputPath (Join-Path -Path $_.FullName -ChildPath en-US)
    }
