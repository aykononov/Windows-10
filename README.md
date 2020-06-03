# Windows-10
Настройки для Windows 10
```txt
"Вывести все пакеты"
Get-AppxPackage | Select Name, PackageFullName

"Удалить пакет для всех пользователей"
Get-AppxPackage -allusers *people* | Remove-AppxPackage

"Удалить все стандартные приложения"
Get-AppxPackage | Remove-AppxPackage

"Удалить все стандартные приложения для всех пользователей"
Get-AppxPackage -allusers | Remove-AppxPackage

"Установка пакета"
Get-WindowsCapability -Online | ? Name -like '*started*'

"Восстановление магазина Microsoft Store"
Get-AppxPackage *windowsstore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppxManifest.xml"}


Все пакеты лежат:
C:\Users\kononov_ay\AppData\Local\Packages\

Пакеты Windows 10 Enterprise.

Name                                        PackageFullName                                                            
----                                        ---------------                                                            
Microsoft.Windows.CloudExperienceHost       Microsoft.Windows.CloudExperienceHost_10.0.18362.387_neutral_neutral_cw5...
Microsoft.AAD.BrokerPlugin                  Microsoft.AAD.BrokerPlugin_1000.18362.387.0_neutral_neutral_cw5n1h2txyewy  
Microsoft.Windows.StartMenuExperienceHost   Microsoft.Windows.StartMenuExperienceHost_10.0.18362.387_neutral_neutral...
Microsoft.Windows.ShellExperienceHost       Microsoft.Windows.ShellExperienceHost_10.0.18362.387_neutral_neutral_cw5...
windows.immersivecontrolpanel               windows.immersivecontrolpanel_10.0.2.1000_neutral_neutral_cw5n1h2txyewy    
Microsoft.Windows.Cortana                   Microsoft.Windows.Cortana_1.13.0.18362_neutral_neutral_cw5n1h2txyewy       
Microsoft.MicrosoftEdge                     Microsoft.MicrosoftEdge_44.18362.387.0_neutral__8wekyb3d8bbwe              
Microsoft.Windows.ContentDeliveryManager    Microsoft.Windows.ContentDeliveryManager_10.0.18362.387_neutral_neutral_...
Windows.PrintDialog                         Windows.PrintDialog_6.2.1.0_neutral_neutral_cw5n1h2txyewy                  
Microsoft.XboxGameCallableUI                Microsoft.XboxGameCallableUI_1000.18362.387.0_neutral_neutral_cw5n1h2txyewy
Microsoft.Windows.SecureAssessmentBrowser   Microsoft.Windows.SecureAssessmentBrowser_10.0.18362.387_neutral_neutral...
Microsoft.Windows.SecHealthUI               Microsoft.Windows.SecHealthUI_10.0.18362.387_neutral__cw5n1h2txyewy        
Windows.CBSPreview                          Windows.CBSPreview_10.0.18362.387_neutral_neutral_cw5n1h2txyewy            
Microsoft.Windows.XGpuEjectDialog           Microsoft.Windows.XGpuEjectDialog_10.0.18362.387_neutral_neutral_cw5n1h2...
Microsoft.Windows.PinningConfirmationDialog Microsoft.Windows.PinningConfirmationDialog_1000.18362.387.0_neutral__cw...
Microsoft.Windows.PeopleExperienceHost      Microsoft.Windows.PeopleExperienceHost_10.0.18362.387_neutral_neutral_cw...
Microsoft.Windows.ParentalControls          Microsoft.Windows.ParentalControls_1000.18362.387.0_neutral_neutral_cw5n...
Microsoft.Windows.OOBENetworkConnectionFlow Microsoft.Windows.OOBENetworkConnectionFlow_10.0.18362.387_neutral__cw5n...
Microsoft.Windows.OOBENetworkCaptivePortal  Microsoft.Windows.OOBENetworkCaptivePortal_10.0.18362.387_neutral__cw5n1...
Microsoft.Windows.NarratorQuickStart        Microsoft.Windows.NarratorQuickStart_10.0.18362.387_neutral_neutral_8wek...
Microsoft.PPIProjection                     Microsoft.PPIProjection_10.0.18362.387_neutral_neutral_cw5n1h2txyewy       
Microsoft.Windows.Apprep.ChxApp             Microsoft.Windows.Apprep.ChxApp_1000.18362.387.0_neutral_neutral_cw5n1h2...
Microsoft.Windows.CallingShellApp           Microsoft.Windows.CallingShellApp_1000.18362.387.0_neutral_neutral_cw5n1...
Microsoft.Windows.CapturePicker             Microsoft.Windows.CapturePicker_10.0.18362.387_neutral__cw5n1h2txyewy      
1527c705-839a-4832-9118-54d4Bd6a0c89        1527c705-839a-4832-9118-54d4Bd6a0c89_10.0.18362.387_neutral_neutral_cw5n...
Microsoft.Win32WebViewHost                  Microsoft.Win32WebViewHost_10.0.18362.387_neutral_neutral_cw5n1h2txyewy    
Microsoft.MicrosoftEdgeDevToolsClient       Microsoft.MicrosoftEdgeDevToolsClient_1000.18362.387.0_neutral_neutral_8...
Microsoft.LockApp                           Microsoft.LockApp_10.0.18362.387_neutral__cw5n1h2txyewy                    
Microsoft.AsyncTextService                  Microsoft.AsyncTextService_10.0.18362.387_neutral__8wekyb3d8bbwe           
c5e2524a-ea46-4f67-841f-6a9465d9d515        c5e2524a-ea46-4f67-841f-6a9465d9d515_10.0.18362.387_neutral_neutral_cw5n...
E2A4F912-2574-4A75-9BB0-0D023378592B        E2A4F912-2574-4A75-9BB0-0D023378592B_10.0.18362.387_neutral_neutral_cw5n...
F46D4000-FD22-4DB4-AC8E-4E1DDDE828FE        F46D4000-FD22-4DB4-AC8E-4E1DDDE828FE_10.0.18362.387_neutral_neutral_cw5n...
InputApp                                    InputApp_1000.18362.387.0_neutral_neutral_cw5n1h2txyewy                    
Microsoft.AccountsControl                   Microsoft.AccountsControl_10.0.18362.387_neutral__cw5n1h2txyewy            
Microsoft.Windows.AssignedAccessLockApp     Microsoft.Windows.AssignedAccessLockApp_1000.18362.387.0_neutral_neutral...
Microsoft.ECApp                             Microsoft.ECApp_10.0.18362.387_neutral__8wekyb3d8bbwe                      
Microsoft.CredDialogHost                    Microsoft.CredDialogHost_10.0.18362.387_neutral__cw5n1h2txyewy             
Microsoft.BioEnrollment                     Microsoft.BioEnrollment_10.0.18362.387_neutral__cw5n1h2txyewy              
```
