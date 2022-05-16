Set-ExecutionPolicy -ExecutionPolicy Unrestricted
$ExecutionContext.SessionState.LanguageMode = "FullLanguage"

# Add GUI capabilities
Add-Type -assembly System.Windows.Forms

# Create the Window
$main_form = New-Object System.Windows.Forms.Form

# Set dimensions
$main_form.Text ='GUI for my PoSh script'

$main_form.Width = 600

$main_form.Height = 400

# Use Auto Resize if the window is out of bounds
<#
$main_form.AutoSize = $true
#>

# Create Label
$Label = New-Object System.Windows.Forms.Label

# Label Name
$Label.Text = "AD users"

# Set Label Location
$Label.Location  = New-Object System.Drawing.Point(0,10)

# Auto Size Label
$Label.AutoSize = $true

$main_form.Controls.Add($Label)


# Create drop down list for AD Users
$ComboBox = New-Object System.Windows.Forms.ComboBox

$ComboBox.Width = 150

$Users = get-aduser -filter * -Properties SamAccountName -SearchBase "ou=is, ou=it, ou=where, dc=controller, dc=domain" -Server Your.Server.Net

Foreach ($User in $Users)

{

$ComboBox.Items.Add($User.SamAccountName);

}

$ComboBox.Location  = New-Object System.Drawing.Point(60,10)

$main_form.Controls.Add($ComboBox)


# Display GUI
$main_form.ShowDialog()