﻿// CodeGear C++Builder
// Copyright (c) 1995, 2017 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frxWatchForm.pas' rev: 33.00 (Windows)

#ifndef FrxwatchformHPP
#define FrxwatchformHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <Winapi.Windows.hpp>
#include <Winapi.Messages.hpp>
#include <System.SysUtils.hpp>
#include <System.Classes.hpp>
#include <Vcl.Graphics.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ComCtrls.hpp>
#include <fs_iinterpreter.hpp>
#include <Vcl.CheckLst.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.ToolWin.hpp>
#include <System.Variants.hpp>
#include <Vcl.Grids.hpp>

//-- user supplied -----------------------------------------------------------

namespace Frxwatchform
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS TfrxWatchForm;
//-- type declarations -------------------------------------------------------
class PASCALIMPLEMENTATION TfrxWatchForm : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Comctrls::TToolBar* ToolBar1;
	Vcl::Comctrls::TToolButton* AddB;
	Vcl::Comctrls::TToolButton* DeleteB;
	Vcl::Comctrls::TToolButton* EditB;
	Vcl::Checklst::TCheckListBox* WatchLBCB;
	Vcl::Comctrls::TTabControl* ListTB;
	Vcl::Grids::TStringGrid* WatchLB;
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormKeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	void __fastcall FormDestroy(System::TObject* Sender);
	void __fastcall AddBClick(System::TObject* Sender);
	void __fastcall DeleteBClick(System::TObject* Sender);
	void __fastcall EditBClick(System::TObject* Sender);
	void __fastcall FormCloseQuery(System::TObject* Sender, bool &CanClose);
	void __fastcall WatchLBCBClickCheck(System::TObject* Sender);
	void __fastcall ListTBChange(System::TObject* Sender);
	void __fastcall FormResize(System::TObject* Sender);
	
private:
	Fs_iinterpreter::TfsScript* FScript;
	bool FScriptRunning;
	System::Classes::TStrings* FWatches;
	System::UnicodeString __fastcall CalcWatch(const System::UnicodeString s);
	
public:
	void __fastcall UpdateWatches();
	__property Fs_iinterpreter::TfsScript* Script = {read=FScript, write=FScript};
	__property bool ScriptRunning = {read=FScriptRunning, write=FScriptRunning, nodefault};
	__property System::Classes::TStrings* Watches = {read=FWatches};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrxWatchForm(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrxWatchForm(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrxWatchForm() { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrxWatchForm(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Frxwatchform */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FRXWATCHFORM)
using namespace Frxwatchform;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FrxwatchformHPP
