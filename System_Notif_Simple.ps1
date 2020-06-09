$title = "Quick notification from Intune"
$message = "I am notification executed in system context"
[reflection.assembly]::loadwithpartialname("System.Windows.Forms")
[reflection.assembly]::loadwithpartialname("System.Drawing")
$path = Get-Process -id $pid | Select-Object -ExpandProperty Path                   
$icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)           
$notify = new-object system.windows.forms.notifyicon
$notify.icon = $icon
$notify.visible = $true
Try
{
	$notify.showballoontip(10,$title,$Message,[system.windows.forms.tooltipicon]::info) 
	new-item "c:\notif_system.txt" -Type File -force  
}
Catch
{}





