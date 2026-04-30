

;########################Shortcut for opening Notepad#####################
^!n::  ; Ctrl+Alt+N
{
    if WinExist("Untitled - Notepad")
        WinActivate
    else
        Run "Notepad"
}


;#########################Shortcut for opening new a google search window#############
^!g::  ; Ctrl+Alt+G
{
    A_Clipboard := ""               ; Clear clipboard to ensure fresh data
	SearchTerm :=""
    Send "^c"                       ; Send Ctrl+C to copy highlighted text
    if !ClipWait(2)                 ; Wait up to 2 seconds for text to copy
    {
        MsgBox "No text was selected."
        return
    }
    
	SearchTerm := StrReplace(A_Clipboard, " ", "+")
	
    ; Directly open Google results with your text
    Run "https://google.com/" . "search?q=" . SearchTerm
}