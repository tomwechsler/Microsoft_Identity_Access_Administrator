Set-Location c:\
Clear-Host

#If needed
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

#Install the AzureAD
Install-Module -Name AzureAD -AllowClobber -Verbose -Force

#Unable to resolve package source ‘https://www.powershellgallery.com/api/v2’

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Connect
Connect-AzureAD

#Did it work?
Get-AzureADUser

#Get an existing group
Get-AzureADMSGroup -SearchString "Administration" | fl *

#Get the SecurityEnabled value
(Get-AzureADMSGroup -SearchString "Administration").SecurityEnabled

#Get an existing group
Get-AzureADMSGroup -SearchString "Buchhaltung"

#Get the SecurityEnabled value
(Get-AzureADMSGroup -SearchString "Buchhaltung").SecurityEnabled

#We change the SecurityEnabled property
Set-AzureADMSGroup -Id 18194e61-f0ce-4e0a-abb6-022f32fdd9e3 -SecurityEnabled $True

#When you create a new Microsoft 365 group in the Microsoft 365 portal, you cannot work with group licensing 
#in Azure Active Directory because the group's SecurityEnabled property has the value false.

#If you create a new Microsoft 365 group in Azure Active Directory, you can work with group licensing in 
#Azure AD because the SecurityEnabled property has a value of true.