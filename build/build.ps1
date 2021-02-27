$RootPath = Get-Item -Path $PSScriptRoot |
    Select-Object -ExpandProperty PSParentPath

$Modules = Join-Path -Path $RootPath -ChildPath Modules |
    Get-ChildItem

$Modules | ForEach-Object {
    Import-Module $_.FullName -Verbose
}
Update-MarkdownHelp -Path .\docs
