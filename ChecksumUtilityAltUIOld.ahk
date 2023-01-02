#Requires AutoHotkey v2.0

CertUtilGUI := Gui()
FileSelect_Text := CertUtilGUI.Add("Text", "x15 y15", "File:")
FileSelect_Edit := CertUtilGUI.Add("Edit", "x70 y10 w400 ReadOnly")
FileSelect_Button := CertUtilGUI.Add("Button", "x475 y10 h22 w80", "Browse")
FileSelect_Button.OnEvent("Click", FileSelect_Click)
MD5_Text := CertUtilGUI.Add("Text", "x15 y40", "MD5:")
MD5_Edit := CertUtilGUI.Add("Edit", "x70 y35 w400 ReadOnly")
MD5_Button := CertUtilGUI.Add("Button", "x475 y35 h22 w80", "Copy MD5")
MD5_Button.OnEvent("Click", MD5_Button_Click)
SHA1_Text := CertUtilGUI.Add("Text", "x15 y65", "SHA-1:")
SHA1_Edit := CertUtilGUI.Add("Edit", "x70 y60 w400 ReadOnly")
SHA1_Button := CertUtilGUI.Add("Button", "x475 y60 h22 w80", "Copy SHA-1")
SHA1_Button.OnEvent("Click", SHA1_Button_Click)
SHA256_Text := CertUtilGUI.Add("Text", "x15 y90", "SHA-256:")
SHA256_Edit := CertUtilGUI.Add("Edit", "x70 y85 w400 ReadOnly")
SHA256_Button := CertUtilGUI.Add("Button", "x475 y85 h22 w80", "Copy SHA-256")
SHA256_Button.OnEvent("Click", SHA256_Button_Click)
SHA512_Text := CertUtilGUI.Add("Text", "x15 y115", "SHA-512:")
SHA512_Edit := CertUtilGUI.Add("Edit", "x70 y110 w400 ReadOnly")
SHA512_Button := CertUtilGUI.Add("Button", "x475 y110 h22 w80", "Copy SHA-512")
SHA512_Button.OnEvent("Click", SHA512_Button_Click)
CertUtilGUI.Show

FileSelect_Click(GuiObject, eventInfo) {
	SelectedFile := FileSelect()
	if (SelectedFile = "") {
		Return
	}
	else {
		FileSelect_Edit.Value := ""
		A_Clipboard := ""
		MD5_Edit.Value := ""
		SHA1_Edit.Value := ""
		SHA256_Edit.Value := ""
		SHA512_Edit.Value := ""
		FileSelect_Edit.Value := SelectedFile
		Run A_ComSpec " /c certutil -hashfile `"" . SelectedFile . "`" MD5 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		MD5_Edit.Value := A_Clipboard
		A_Clipboard := ""
		Run A_ComSpec " /c certutil -hashfile `"" . SelectedFile . "`" SHA1 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		SHA1_Edit.Value := A_Clipboard
		A_Clipboard := ""
		Run A_ComSpec " /c certutil -hashfile `"" . SelectedFile . "`" SHA256 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		SHA256_Edit.Value := A_Clipboard
		A_Clipboard := ""
		Run A_ComSpec " /c certutil -hashfile `"" . SelectedFile . "`" SHA512 | findstr /v `"hash`" | clip ",, "Hide"
		ClipWait
		SHA512_Edit.Value := A_Clipboard
	}
}

MD5_Button_Click(GuiObject, eventInfo) {
	A_Clipboard := MD5_Edit.Value
}

SHA1_Button_Click(GuiObject, eventInfo) {
	A_Clipboard := SHA1_Edit.Value
}

SHA256_Button_Click(GuiObject, eventInfo) {
	A_Clipboard := SHA256_Edit.Value
}

SHA512_Button_Click(GuiObject, eventInfo) {
	A_Clipboard := SHA512_Edit.Value
}