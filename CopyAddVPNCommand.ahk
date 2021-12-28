#SingleInstance, Force


;	###########################		Copy Commands Button Variables	#################################
;	
;	#########	Networking Tab	#######
Network_Button_1 = ipconfig /all

;	#####################################		GUI Design			####################################
Gui, Add, Text,, Enter VPN Name
Gui, Add, Edit, W180 vVPNNAME, VPN

Gui, Add, Text,, Enter Server Address
Gui, Add, Edit, W180 vVPNADDRESS

Gui, Add, Text,, Enter Pre-Shared Key
Gui, Add, Edit, W180 vSECRETKEY

Gui, Add, Button, gCopy, COPY


Gui, Show, W200 H210, Copy Add VPN Command				; Display GUI
return											; End of auto-execute section. The script is idle until the user does something.




;	################	Copy Button	Output	##################
Copy:												; Enter what the button will do below


GuiControlGet, VPNNAME,, %VPNNAME%	; Get the data from the button that was presses
GuiControlGet, VPNADDRESS,, %VPNADDRESS%	; Get the data from the button that was presses	
GuiControlGet, SECRETKEY,, %SECRETKEY%	; Get the data from the button that was presses	
	
						
Clipboard = Add-VpnConnection -AllUserConnection -Name `"%VPNNAME%`" -ServerAddress %VPNADDRESS% -TunnelType L2tp -EncryptionLevel Optional -AuthenticationMethod PAP -L2tpPsk `"%SECRETKEY%`" -Force -PassThru


	MsgBox, 32, Copied Command to Clipboard, Add-VpnConnection -AllUserConnection -Name `"%VPNNAME%`" -ServerAddress %VPNADDRESS% -TunnelType L2tp -EncryptionLevel Optional -AuthenticationMethod PAP -L2tpPsk `"%SECRETKEY%`" -Force -PassThru, 2 							
	ExitApp

											; Reload the GUI
return	

;	Close Button, Exit Script
GuiClose:
GuiEscape:
	ExitApp


