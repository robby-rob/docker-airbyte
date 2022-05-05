$airbyte_release = Get-Content version | Select-Object -First 1
Set-Location source
Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Get-Content -Raw .\run.sh)))