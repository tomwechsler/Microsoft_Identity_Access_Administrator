Set-Location C:\
Clear-Host

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#We need the exchange online module
Install-Module -Name ExchangeOnlineManagement -Verbose -AllowClobber -Force

#Create a variable with credentials
$cred = Get-Credential

#Lets connect
Connect-ExchangeOnline –Credential $cred

#Did it work?
Get-Mailbox

#Verify the auditing status for your organization
Get-AdminAuditLogConfig | FL UnifiedAuditLogIngestionEnabled

#Use PowerShell to turn on auditing
Set-AdminAuditLogConfig -UnifiedAuditLogIngestionEnabled $true

#Turn off auditing
Set-AdminAuditLogConfig -UnifiedAuditLogIngestionEnabled $false

#Verify the auditing status for your organization
Get-AdminAuditLogConfig | FL UnifiedAuditLogIngestionEnabled