#Singleinstance, Force

Gui, cbhelper:new
Gui +LastFound +AlwaysOnTop +ToolWindow
Gui, cbhelper:Add, Text,vVar ,Sockets: X-X-X-X-X-X-X

; TODO: consider making this a loop. maybe show in cursor tooltip instead of window.
^#C::
{
	BlockInput, On
	; Sent Ctrl C
	Send, {Ctrl Down}C{Ctrl Up}
	; Now parse the clipboard
	SocketInfo := RegExMatch(Clipboard, "\n(Sockets:[^\n]+)\n",SubPat)
	GuiControl,cbhelper:text,Var, %SubPat1%
	BlockInput, Off
	Gui, cbhelper:Show 
    return
}

; Close window on Escape
cbhelperGuiEscape:
{
   Gui, cbhelper:Hide
   return
}
