; Created by Jim Thomas, Jr.
; www.scatterbraintech.com
; This program enables user defined hotkeys
; Feel free to modify this code and use it however you want.

#include <Misc.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <IE.au3>
#include <ScreenCapture.au3>


HotKeySet("+{F1}", "_Exit") ;Press SHIFT + F1 to exit

$cmd_1 = IniRead("hotkeys.ini","commands", "cmd_1", "There is a problem with the .ini file")
$cmd_2 = IniRead("hotkeys.ini","commands", "cmd_2", "There is a problem with the .ini file")
$cmd_3 = IniRead("hotkeys.ini","commands", "cmd_3", "There is a problem with the .ini file")
$cmd_4 = IniRead("hotkeys.ini","commands", "cmd_4", "There is a problem with the .ini file")
$cmd_5 = IniRead("hotkeys.ini","commands", "cmd_5", "There is a problem with the .ini file")
$cmd_6 = IniRead("hotkeys.ini","commands", "cmd_6", "There is a problem with the .ini file")
$cmd_7 = IniRead("hotkeys.ini","commands", "cmd_7", "There is a problem with the .ini file")

Global $isOnTop = False
Global $titleOnTop, $title, $isHidden
Global $accuWeatherRadarLink = "http://sirocco.accuweather.com/nx_mosaic_400x300_public/sir/inmSIRVA_.gif"

HotKeySet("^{F1}", "_Showcmd") ;Press CTRL + F1 to see the cmds you have on which keys
HotKeySet("^1", "_cmd1") 
HotKeySet("^2", "_cmd2") 
HotKeySet("^3", "_cmd3") 
HotKeySet("^4", "_cmd4") 
HotKeySet("^5", "_cmd5") 
HotKeySet("^6", "_cmd6") 
HotKeySet("^7", "_cmd7") 
HotKeySet("^8", "_cmd8")
HotKeySet("^9", "_cmd9") 
HotKeySet("^0", "_cmd0") 
HotKeySet("^r", "EasyRun") 
HotKeySet("^{F11}", "DesktopHideShow")
HotKeySet("^{F12}", "WebSearch")
HotKeySet("^`", "HideShowWin")
HotKeySet("^{PGUP}", "HideShowWin")
HotKeySet("^q", "EasySearch")
HotKeySet("!1", "OpenCmdHere") ; ALT+1
HotKeySet("!2", "ShowRadar") ; ALT+2
HotKeySet("^m", "EasyScreenCap")

Func EasyScreenCap()
	$activeTitle = WinGetTitle("[ACTIVE]")
	$activeHWND= WinGetHandle ($activeTitle)
	
	$fileName = @MyDocumentsDir & "\_capture_" & @YEAR & @MON & @MDAY & "_" & @HOUR & @MIN & "_" & @SEC & ".jpg"
	
	_ScreenCapture_CaptureWnd($fileName, $activeHWND)
	ShellExecute($fileName)
EndFunc

Func _Exit()
	Exit
EndFunc 

Func _Showcmd()
	TrayTip("cmds:", "CTRL + 1: " & $cmd_1 & @CRLF & "CTRL + 2: " & $cmd_2 & @CRLF & "CTRL + 3: " & $cmd_3 & @CRLF & "CTRL + 4: " & $cmd_4 & @CRLF & "CTRL + 5: " & $cmd_5 & @CRLF &"CTRL + 6: " & $cmd_6 & @CRLF &"CTRL + 7: " & $cmd_7 &@CRLF & "SHIFT + F1: Exit", 4)
EndFunc

Func _cmd1()
	$cmd_1 = IniRead("hotkeys.ini","commands", "cmd_1", "There is a problem with the .ini file")
	Run("cmd /c start " & $cmd_1, "", @SW_HIDE)
EndFunc

Func _cmd2()
	$cmd_2 = IniRead("hotkeys.ini","commands", "cmd_2", "There is a problem with the .ini file")
	Run("cmd /c start " & $cmd_2, "", @SW_HIDE)
EndFunc 

Func _cmd3()
	$cmd_3 = IniRead("hotkeys.ini","commands", "cmd_3", "There is a problem with the .ini file")
	Run("cmd /c start " & $cmd_3, "", @SW_HIDE)
EndFunc

Func _cmd4()
	$cmd_4 = IniRead("hotkeys.ini","commands", "cmd_4", "There is a problem with the .ini file")
	Run("cmd /c start " & $cmd_4, "", @SW_HIDE)
EndFunc

Func _cmd5()
	$cmd_5 = IniRead("hotkeys.ini","commands", "cmd_5", "There is a problem with the .ini file")
	Run("cmd /c start " & $cmd_5, "", @SW_HIDE)
EndFunc 

Func _cmd6()
	$cmd_6 = IniRead("hotkeys.ini","commands", "cmd_6", "There is a problem with the .ini file")
	Run("cmd /c start " & $cmd_6, "", @SW_HIDE)
EndFunc 

Func _cmd7()
	$cmd_7 = IniRead("hotkeys.ini","commands", "cmd_7", "There is a problem with the .ini file")
	Run("cmd /c start " & $cmd_7, "", @SW_HIDE)
EndFunc

; This worked for WindowsXP, it's semi-broken on Vista and 7.
Func _cmd8()
	$title = WinGetTitle("[ACTIVE]")
	
	if $isOnTop = False Then
		WinSetOnTop($title,"",1)	
		$isOnTop = True
		$titleOnTop = $title
		TrayTip("WinSetOnTop", $titleOnTop & " is on top", 3)	
	Else
		WinSetOnTop($titleOnTop,"",0)
		$isOnTop = False	
		TrayTip("WinSetOnTop", "No windows are on top", 3)	
	EndIf
	
EndFunc

; Set window transparency to 127
Func _cmd9()
		$activeTitle = WinGetTitle("[ACTIVE]")
		WinSetTrans($activeTitle, "", 127) 	
EndFunc

; Set window transparency to 255
Func _cmd0()
		$activeTitle = WinGetTitle("[ACTIVE]")
		WinSetTrans($activeTitle, "", 255) 	
	EndFunc

; Copy selected text and pass to cmd /c
Func EasyRun()
	Send("^c")
	ShellExecute(ClipGet())
	Sleep(100)	; to avoid multiple key strokes
EndFunc

; Shows web search and wikipedia search bar.
Func WebSearch()
	if Not WinActive("Web Search") then 
		$dll = DllOpen("user32.dll")
		$myLeft = @DesktopWidth / 2 - 145
		$myTop = @DesktopHeight - 140
		$Form1 = GUICreate("Web Search", 290, 70, $myLeft, $myTop)
		GUISetBkColor(0x000000) ;
		$InputGoogle = GUICtrlCreateInput("", 96, 8, 153, 21)
		$LabelGoogle = GUICtrlCreateLabel("Google Search:", 16, 8, 78, 17)
		GUICtrlSetColor(-1, 0x008000) ;
		$InputWiki = GUICtrlCreateInput("", 96, 35, 153, 21)
		$LabelWiki = GUICtrlCreateLabel("Wikipedia Search:", 4, 35, 91, 17)
		GUICtrlSetColor(-1, 0x008000) ;
		
		GUISetState(@SW_SHOW)

		While 1
			$nMsg = GUIGetMsg()
			
			Switch $nMsg
				Case $GUI_EVENT_CLOSE
					GUISetState(@SW_HIDE)			
			EndSwitch
			
			if _IsPressed("0D", $dll) and WinActive("Web Search") Then 
				if GUICtrlRead($InputGoogle) <> "" Then
					$myGoogleSearchString = GUICtrlRead($InputGoogle) 
					$myGoogleSearchString = StringReplace($myGoogleSearchString, " ", "+")
					; Need to un-hardcode search URL
					$googleString = "http://www.google.com/search?hl=en^&q=+" & $myGoogleSearchString 
					Run("cmd /c start " & $googleString, "", @SW_HIDE)
					GUISetState(@SW_HIDE)
				EndIf
				
				if GUICtrlRead($InputWiki) <> "" Then					
					$myWikiSearchString = GUICtrlRead($InputWiki) 
					$myWikiSearchString = StringReplace($myWikiSearchString , " ", "+")
					; Need to un-hardcode search URL
					$wikiString = "http://en.wikipedia.org/wiki/Special:Search^?search=" & $myWikiSearchString 
					Run("cmd /c start " & $wikiString, "", @SW_HIDE)
					GUISetState(@SW_HIDE)					
				EndIf
			EndIf	
		WEnd
		
		DllClose($dll)
	EndIf
EndFunc

; Hides/unhides active window
Func HideShowWin()
	if WinGetTitle("[ACTIVE]") <> "" then 
		If	$isHidden = "" Then
			$window2Hide = WinGetTitle("[ACTIVE]")
			WinSetState($window2Hide , "", @SW_HIDE)
			$isHidden = $window2Hide 
			TraySetIcon("Shell32.dll",24)
		Else
			WinSetState($isHidden , "", @SW_SHOW)
			WinActivate($isHidden)	
			$isHidden = ""	
			TraySetIcon("Shell32.dll",100)		
		EndIf
	EndIf
	
EndFunc

Func EasySearch()
	Sleep(100)
	Send("^c")
	$myEasySearch = ClipGet()
	$myEasySearch = StringReplace($myEasySearch, " ", "+")
	; Need to un-hardcode search URL
	$myEasySearchString = "http://www.google.com/search?hl=en^&q=+" & $myEasySearch
	Run("cmd /c start " & $myEasySearchString, "", @SW_HIDE)
EndFunc

; Open a cmd prompt with green type.
Func OpenCmdHere()
	$hwnd1 = WinGetHandle("[CLASS:CabinetWClass]","")
	$hwnd2 = WinGetHandle("[CLASS:ExplorerWClass]","")
	
	If $hwnd1<>"" AND WinActive($hwnd1,"") Then
		$text = ControlGetText($hwnd1,"","Edit1")
	ElseIf $hwnd2<>"" AND WinActive($hwnd2,"") Then
		$text = ControlGetText($hwnd2,"","Edit1")
	Else
		$text = "%userprofile%\desktop"
	EndIf
	
	Run("cmd /T:02 /k cd /d "& $text)
EndFunc

; Download Accuweather radar and display it.
Func ShowRadar()
	InetGet($accuWeatherRadarLink, "radar.gif")

	#Region ### START Koda GUI section ### Form=
	$radarPosLeft = (@DesktopWidth / 2) - 203
	$radarPosTop = @DesktopHeight - 400
	$Form1 = GUICreate("Radar", 405, 337, $radarPosLeft,$radarPosTop)
	$Pic1 = GUICtrlCreatePic("radar.gif" , 0, 0, 405, 337 )
	GUISetState(@SW_SHOW)
	WinSetOnTop("Radar","",1)
	#EndRegion ### END Koda GUI section ###

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUISetState(@SW_HIDE)	
		EndSwitch
	WEnd

EndFunc

; Nice for non-admin accounts that can't delete All User shortcuts.
func DesktopHideShow()
	$state = WinGetState("Program Manager", "")

	If BitAnd($state, 2) Then
		WinSetState("Program Manager","", @SW_HIDE)	
	EndIf
	
	If not BitAnd($state, 2) Then
		WinSetState("Program Manager","", @SW_SHOW)
	EndIf
EndFunc

While 1
	sleep(100)
WEnd

Func db($msg)
	ConsoleWrite($msg & @CRLF)
EndFunc
