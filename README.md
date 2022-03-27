# UntitleTagGame

## Script

```lua
--Change the color of the ESP to whatever you want

_G.RoleColors = {
	Runner = Color3.fromRGB(26, 19, 255), 
	Survivor = Color3.fromRGB(255, 239, 11),
	Frozen = Color3.fromRGB(255, 255, 255),
	Tagger = Color3.fromRGB(255, 0, 0),
	CompetitiveTagger = Color3.fromRGB(255, 0, 0),
	FreezeTagger = Color3.fromRGB(0, 200, 255),
	BombTagger = Color3.fromRGB(255, 119, 0),
	FFATagger = Color3.fromRGB(126, 0, 2),
	Infected = Color3.fromRGB(6, 132, 0),
	Slasher = Color3.fromRGB(184, 56, 2),
	PatientZero = Color3.fromRGB(67, 0, 90),
	Dead = Color3.fromRGB(67, 67, 67),
	NoRole = Color3.fromRGB(0, 0, 0),
	
	BlueTeam = Color3.fromRGB(0, 17, 255),
	RedTeam = Color3.fromRGB(255, 0, 0),
	GreenTeam = Color3.fromRGB(59, 255, 0),
	YellowTeam = Color3.fromRGB(255, 217, 0)
}


_G.DisableESP = false --Set this to true and re-execute if you want to disable the esp.

wait()
---------------------------------------------------------
loadstring(game:HttpGet("https://raw.githubusercontent.com/irlng/UntitleTagGame/main/ESP.lua", true))()
```
