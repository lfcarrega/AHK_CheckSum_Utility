#Requires AutoHotkey v2.0

CertUtilGUI := Gui()
FileSelect_Text := CertUtilGUI.Add("Text", "", "File:")
FileSelect_Edit := CertUtilGUI.Add("Edit", "x+46 yp w300 ReadOnly")
FileSelect_Button := CertUtilGUI.Add("Button", "yp w60", "Browse")
FileSelect_Button.OnEvent("Click", FileSelect_Click)
CheckSum_Text := CertUtilGUI.Add("Text", "xm", "Checksum:")
CheckSum_Edit := CertUtilGUI.Add("Edit", "x+11 yp w300 ReadOnly")
CheckSum_Button := CertUtilGUI.Add("Button", "yp w60", "Copy")
CheckSum_Button.OnEvent("Click", CheckSum_Click)
Compare_Text := CertUtilGUI.Add("Text", "xm", "Compare:")
Compare_Edit := CertUtilGUI.Add("Edit", "x+19 yp w300")
Compare_Button := CertUtilGUI.Add("Button", "yp w60", "Compare")
Compare_Button.OnEvent("Click", Compare_Click)
MD2_Button := CertUtilGUI.Add("Button", "xm+20 w50", "MD2")
MD2_Button.OnEvent("Click", MD2_Button_Click)
MD4_Button := CertUtilGUI.Add("Button", "yp wp", "MD4")
MD4_Button.OnEvent("Click", MD4_Button_Click)
MD5_Button := CertUtilGUI.Add("Button", "yp wp", "MD5")
MD5_Button.OnEvent("Click", MD5_Button_Click)
SHA1_Button := CertUtilGUI.Add("Button", "yp wp", "SHA-1")
SHA1_Button.OnEvent("Click", SHA1_Button_Click)
SHA384_Button := CertUtilGUI.Add("Button", "yp wp", "SHA-384")
SHA384_Button.OnEvent("Click", SHA384_Button_Click)
SHA256_Button := CertUtilGUI.Add("Button", "yp wp", "SHA-256")
SHA256_Button.OnEvent("Click", SHA256_Button_Click)
SHA512_Button := CertUtilGUI.Add("Button", "yp wp", "SHA-512")
SHA512_Button.OnEvent("Click", SHA512_Button_Click)
CertUtilGUI.Show

FileSelect_Click(GuiObject, eventInfo) {
	SelectedFile := FileSelect()
	if (SelectedFile = "") {
		Return
	}
	FileSelect_Edit.Value := SelectedFile
}

MD2_Button_Click(GuiObject, eventInfo) {
	if (FileSelect_Edit.Value = "") {
		Return
	}
	else {
		A_Clipboard := ""
		CheckSum_Edit.Value := ""
		CheckSum_Text.Value := "Checksum:"
		CheckSum_Edit.Value := "Please wait..."
		Run A_ComSpec " /c certutil -hashfile `"" . FileSelect_Edit.Value . "`" MD2 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		CheckSum_Text.Value := "MD2:"
	}
}

MD4_Button_Click(GuiObject, eventInfo) {
	if (FileSelect_Edit.Value = "") {
		Return
	}
	else {
		A_Clipboard := ""
		CheckSum_Edit.Value := ""
		CheckSum_Text.Value := "Checksum:"
		CheckSum_Edit.Value := "Please wait..."
		Run A_ComSpec " /c certutil -hashfile `"" . FileSelect_Edit.Value . "`" MD4 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		CheckSum_Edit.Value := A_Clipboard
		CheckSum_Text.Value := "MD4:"
	}
}

MD5_Button_Click(GuiObject, eventInfo) {
	if (FileSelect_Edit.Value = "") {
		Return
	}
	else {
		A_Clipboard := ""
		CheckSum_Edit.Value := ""
		CheckSum_Text.Value := "Checksum:"
		CheckSum_Edit.Value := "Please wait..."
		Run A_ComSpec " /c certutil -hashfile `"" . FileSelect_Edit.Value . "`" MD5 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		CheckSum_Edit.Value := A_Clipboard
		CheckSum_Text.Value := "MD5:"
	}
}

SHA1_Button_Click(GuiObject, eventInfo) {
	if (FileSelect_Edit.Value = "") {
		Return
	}
	else {
		A_Clipboard := ""
		CheckSum_Edit.Value := ""
		CheckSum_Text.Value := "Checksum:"
		CheckSum_Edit.Value := "Please wait..."
		Run A_ComSpec " /c certutil -hashfile `"" . FileSelect_Edit.Value . "`" SHA1 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		CheckSum_Edit.Value := A_Clipboard
		CheckSum_Text.Value := "SHA-1:"
	}
}

SHA384_Button_Click(GuiObject, eventInfo) {
	if (FileSelect_Edit.Value = "") {
		Return
	}
	else {
		A_Clipboard := ""
		CheckSum_Edit.Value := ""
		CheckSum_Text.Value := "Checksum:"
		CheckSum_Edit.Value := "Please wait..."
		Run A_ComSpec " /c certutil -hashfile `"" . FileSelect_Edit.Value . "`" SHA384 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		CheckSum_Edit.Value := A_Clipboard
		CheckSum_Text.Value := "SHA-384:"
	}
}

SHA256_Button_Click(GuiObject, eventInfo) {
	if (FileSelect_Edit.Value = "") {
		Return
	}
	else {
		A_Clipboard := ""
		CheckSum_Edit.Value := ""
		CheckSum_Text.Value := "Checksum:"
		CheckSum_Edit.Value := "Please wait..."
		Run A_ComSpec " /c certutil -hashfile `"" . FileSelect_Edit.Value . "`" SHA256 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		CheckSum_Edit.Value := A_Clipboard
		CheckSum_Text.Value := "SHA-256:"
	}
}

SHA512_Button_Click(GuiObject, eventInfo) {
	if (FileSelect_Edit.Value = "") {
		Return
	}
	else {
		A_Clipboard := ""
		CheckSum_Edit.Value := ""
		CheckSum_Text.Value := "Checksum:"
		CheckSum_Edit.Value := "Please wait..."
		Run A_ComSpec " /c certutil -hashfile `"" . FileSelect_Edit.Value . "`" SHA512 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		CheckSum_Edit.Value := A_Clipboard
		CheckSum_Text.Value := "SHA-512:"
	}
}

CheckSum_Click(GuiObject, eventInfo) {
		A_Clipboard := CheckSum_Edit.Value
}

Compare_Click(GuiObject, eventInfo) {
	Str1 := CheckSum_Edit.Value
	Str2 := Compare_Edit.Value
	NewStr := StrReplace(Str1, Str2)
	Length := StrLen(NewStr)
	if (Compare_Edit.Value = "" or CheckSum_Edit.Value = "" or FileSelect_Edit.Value = "") {
		Return
	}
	if (Length > 2) {
		Compare_Text.Value := "Invalid"
		Compare_Edit.SetFont("Bold cRed")
	}
	else {
		Compare_Text.Value := "Valid"
		Compare_Edit.SetFont("Bold cGreen")
	}
}