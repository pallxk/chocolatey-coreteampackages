﻿$packageName = '{{PackageName}}'

$app = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -match 'Jitsi'}
if ($app) {
  $msiArgs = $('/x' + $app.IdentifyingNumber + ' /q REBOOT=ReallySuppress')
  Start-ChocolateyProcessAsAdmin $msiArgs 'msiexec'
}
