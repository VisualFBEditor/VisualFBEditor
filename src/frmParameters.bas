﻿'#Compile -exx "Form1.rc"
#include once "frmParameters.bi"
#include once "Main.bi"

'#Region "Form"
    Constructor frmParameters
    	' frmParameters
    	This.Name = "frmParameters"
    	This.Text = "Parameters"
    	This.Caption = "Parameters"
    	This.StartPosition = FormStartPosition.CenterParent
    	This.CancelButton = @cmdCancel
    	This.DefaultButton = @cmdOK
    	This.OnCreate = @Form_Create
    	This.OnShow = @Form_Show
    	This.SetBounds 0, 0, 742, 348
    	' grbCompile
    	grbCompile.Name = "grbCompile"
    	grbCompile.Text = "Compile"
    	grbCompile.SetBounds 8, 8, 712, 88
    	grbCompile.Parent = @This
    	' grbMake
    	grbMake.Name = "grbMake"
    	grbMake.Text = "Make"
    	grbMake.SetBounds 8, 96, 712, 88
    	grbMake.Parent = @This
    	' grbRun
    	grbRun.Name = "grbRun"
    	grbRun.Text = "Run"
    	grbRun.SetBounds 8, 184, 712, 88
    	grbRun.Parent = @This
    	' cmdOK
    	cmdOK.Name = "cmdOK"
    	cmdOK.Default = True
    	cmdOK.Text = "OK"
    	cmdOK.SetBounds 528, 280, 96, 24
    	cmdOK.Caption = "OK"
    	cmdOK.OnClick = @cmdOK_Click
    	cmdOK.Parent = @This
    	' cmdCancel
    	cmdCancel.Name = "cmdCancel"
    	cmdCancel.Text = "Cancel"
    	cmdCancel.SetBounds 624, 280, 96, 24
    	cmdCancel.Caption = "Cancel"
    	cmdCancel.OnClick = @cmdCancel_Click
    	cmdCancel.Parent = @This
    	' txtfbc64
    	With txtfbc64
    		.Name = "txtfbc64"
    		.SetBounds 280, 56, 425, 21
    		.Parent = @This
    	End With
    	' txtfbc32
    	With txtfbc32
    		.Name = "txtfbc32"
    		.SetBounds 280, 32, 425, 21
    		.Parent = @This
    	End With
    	' txtMake1
    	With txtMake1
    		.Name = "txtMake1"
    		.SetBounds 280, 120, 425, 21
    		.Parent = @This
    	End With
    	' txtMake2
    	With txtMake2
    		.Name = "txtMake2"
    		.SetBounds 280, 144, 425, 21
    		.Parent = @This
    	End With
    	' txtRun
    	With txtRun
    		.Name = "txtRun"
    		.SetBounds 280, 208, 425, 21
    		.Parent = @This
    	End With
    	' lblfbc32
    	With lblfbc32
    		.Name = "lblfbc32"
    		.Text = "fbc 32-bit:"
    		.SetBounds 24, 34, 56, 16
    		.Caption = "fbc 32-bit:"
    		.Parent = @This
    	End With
    	' lblfbc64
    	With lblfbc64
    		.Name = "lblfbc64"
    		.Text = "fbc 64-bit:"
    		.SetBounds 24, 59, 56, 16
    		.Caption = "fbc 64-bit:"
    		.Parent = @This
    	End With
    	' lblMake1
    	With lblMake1
    		.Name = "lblMake1"
    		.Text = "make 1:"
    		.SetBounds 24, 124, 56, 16
    		.Caption = "make 1:"
    		.Parent = @This
    	End With
    	' llblMake2
    	With llblMake2
    		.Name = "llblMake2"
    		.Text = "make 2:"
    		.SetBounds 24, 147, 56, 16
    		.Caption = "make 2:"
    		.Parent = @This
    	End With
    	' lblRun
    	With lblRun
    		.Name = "lblRun"
    		.Text = "run:"
    		.SetBounds 24, 212, 56, 16
    		.Caption = "run:"
    		.Parent = @This
    	End With
    	' lblDebug
    	With lblDebug
    		.Name = "lblDebug"
    		.Text = "debug:"
    		.SetBounds 24, 235, 56, 17
    		.Caption = "debug:"
    		.Parent = @This
    	End With
    	' txtDebug
    	With txtDebug
    		.Name = "txtDebug"
    		.Text = ""
    		.SetBounds 280, 232, 425, 21
    		.Parent = @This
    	End With
    	' cboCompiler32
    	With cboCompiler32
    		.Name = "cboCompiler32"
    		.Text = "ComboBoxEdit1"
    		.SetBounds 88, 32, 192, 21
    		.Parent = @This
    	End With
    	' cboCompiler64
    	With cboCompiler64
    		.Name = "cboCompiler64"
    		.Text = "ComboBoxEdit11"
    		.SetBounds 88, 56, 192, 21
    		.Parent = @This
    	End With
    	' cboMake1
    	With cboMake1
    		.Name = "cboMake1"
    		.Text = "ComboBoxEdit12"
    		.SetBounds 88, 120, 192, 21
    		.Parent = @This
    	End With
    	' cboMake2
    	With cboMake2
    		.Name = "cboMake2"
    		.Text = "ComboBoxEdit111"
    		.SetBounds 88, 144, 192, 21
    		.Parent = @This
    	End With
    	' cboRun
    	With cboRun
    		.Name = "cboRun"
    		.Text = "ComboBoxEdit13"
    		.SetBounds 88, 208, 192, 21
    		.Parent = @This
    	End With
    	' cboDebug
    	With cboDebug
    		.Name = "cboDebug"
    		.Text = "ComboBoxEdit112"
    		.SetBounds 88, 232, 192, 21
    		.Parent = @This
    	End With
    End Constructor
    
    Dim Shared fParameters As frmParameters
    pfParameters = @fParameters
    
    #ifndef _NOT_AUTORUN_FORMS_
        fParameters.Show
        
        App.Run
    #endif
'#End Region

Sub frmParameters.LoadSettings()
	With fParameters
		.txtfbc32.Text = *Compiler32Arguments
		.txtfbc64.Text = *Compiler64Arguments
		.txtMake1.Text = *Make1Arguments
		.txtMake2.Text = *Make2Arguments
		.txtRun.Text = *RunArguments
		.txtDebug.Text = *DebugArguments
		.cboCompiler32.Clear
		.cboCompiler32.AddItem ML("Default")
		.cboCompiler64.Clear
		.cboCompiler64.AddItem ML("Default")
		For i As Integer = 0 To pCompilers->Count - 1
			.cboCompiler32.AddItem pCompilers->Item(i)->Key
			.cboCompiler64.AddItem pCompilers->Item(i)->Key
		Next
		.cboCompiler32.ItemIndex = Max(0, .cboCompiler32.IndexOf(*CurrentCompiler32))
		.cboCompiler64.ItemIndex = Max(0, .cboCompiler64.IndexOf(*CurrentCompiler64))
		.cboMake1.Clear
		.cboMake1.AddItem ML("Default")
		.cboMake2.Clear
		.cboMake2.AddItem ML("Default")
		For i As Integer = 0 To pMakeTools->Count - 1
			.cboMake1.AddItem pMakeTools->Item(i)->Key
			.cboMake2.AddItem pMakeTools->Item(i)->Key
		Next
		.cboMake1.ItemIndex = Max(0, .cboMake1.IndexOf(*CurrentMakeTool1))
		.cboMake2.ItemIndex = Max(0, .cboMake2.IndexOf(*CurrentMakeTool2))
		.cboRun.Clear
		.cboRun.AddItem ML("Default")
		For i As Integer = 0 To pTerminals->Count - 1
			.cboRun.AddItem pTerminals->Item(i)->Key
		Next
		.cboRun.ItemIndex = Max(0, .cboRun.IndexOf(*CurrentTerminal))
		.cboDebug.Clear
		.cboDebug.AddItem ML("Default")
		.cboDebug.AddItem ML("Integrated IDE Debugger")
		For i As Integer = 0 To pDebuggers->Count - 1
			.cboDebug.AddItem pDebuggers->Item(i)->Key
		Next
		.cboDebug.ItemIndex = Max(0, .cboDebug.IndexOf(*CurrentDebugger))
	End With
End Sub

Private Sub frmParameters.Form_Create(ByRef Sender As Control)
	With fParameters
		.LoadSettings
	End With
End Sub

Private Sub frmParameters.Form_Show(ByRef Sender As Form)
	fParameters.LoadSettings
End Sub

Private Sub frmParameters.cmdOK_Click(ByRef Sender As Control)
	With fParameters
		WLet Compiler32Arguments, .txtfbc32.Text
		WLet Compiler64Arguments, .txtfbc64.Text
		WLet Make1Arguments, .txtMake1.Text
		WLet Make2Arguments, .txtMake2.Text
		WLet RunArguments, .txtRun.Text
		WLet CurrentCompiler32, .cboCompiler32.Text
		WLet Compiler32Path, pCompilers->Get(*CurrentCompiler32, pCompilers->Get(*DefaultCompiler32))
		WLet CurrentCompiler64, .cboCompiler64.Text
		WLet Compiler64Path, pCompilers->Get(*CurrentCompiler64, pCompilers->Get(*DefaultCompiler64))
		WLet CurrentMakeTool1, .cboMake1.Text
		WLet MakeToolPath, pMakeTools->Get(*CurrentMakeTool1, pMakeTools->Get(*DefaultMakeTool))
		WLet CurrentMakeTool2, .cboMake2.Text
		WLet MakeToolPath, pMakeTools->Get(*CurrentMakeTool2, pMakeTools->Get(*DefaultMakeTool))
		WLet CurrentTerminal, .cboRun.Text
		WLet TerminalPath, IIf(.cboRun.ItemIndex = 0, pTerminals->Get(*DefaultTerminal), pTerminals->Get(*CurrentTerminal))
		WLet CurrentDebugger, .cboDebug.Text
		WLet DebuggerPath, IIf(.cboDebug.ItemIndex = 0, pDebuggers->Get(*DefaultDebugger), pDebuggers->Get(*CurrentDebugger))
		piniSettings->WriteString "Parameters", "Compiler32Arguments", *Compiler32Arguments
		piniSettings->WriteString "Parameters", "Compiler64Arguments", *Compiler64Arguments
		piniSettings->WriteString "Parameters", "Make1Arguments", *Make1Arguments
		piniSettings->WriteString "Parameters", "Make2Arguments", *Make2Arguments
		piniSettings->WriteString "Parameters", "RunArguments", *RunArguments
		.CloseForm
	End With
End Sub

Private Sub frmParameters.cmdCancel_Click(ByRef Sender As Control)
	fParameters.CloseForm
End Sub

