HA$PBExportHeader$w_pfcsecurity_reportuser.srw
$PBExportComments$Report on user information
forward
global type w_pfcsecurity_reportuser from w_sheet
end type
type dw_report from u_dw within w_pfcsecurity_reportuser
end type
type ddplb_users from dropdownpicturelistbox within w_pfcsecurity_reportuser
end type
type st_1 from u_st within w_pfcsecurity_reportuser
end type
end forward

global type w_pfcsecurity_reportuser from w_sheet
int X=110
int Y=172
int Width=2793
int Height=1688
boolean TitleBar=true
string Title="PFC Security User Report"
string MenuName="m_pfcsecurity_reports"
long BackColor=80263328
dw_report dw_report
ddplb_users ddplb_users
st_1 st_1
end type
global w_pfcsecurity_reportuser w_pfcsecurity_reportuser

type variables

end variables

on w_pfcsecurity_reportuser.create
int iCurrent
call super::create
if this.MenuName = "m_pfcsecurity_reports" then this.MenuID = create m_pfcsecurity_reports
this.dw_report=create dw_report
this.ddplb_users=create ddplb_users
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_report
this.Control[iCurrent+2]=this.ddplb_users
this.Control[iCurrent+3]=this.st_1
end on

on w_pfcsecurity_reportuser.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_report)
destroy(this.ddplb_users)
destroy(this.st_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  w_pfcsecurity_report_user
//
//	Description:  Allows the setting of security for a window user combination
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the GNU Lesser General
 * Public License Version 2.1, February 1999
 *
 * http://www.gnu.org/copyleft/lesser.html
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see http://pfc.codexchange.sybase.com
*/
//
//////////////////////////////////////////////////////////////////////////////
ddplb_users.AddPicture("Custom076!")
ddplb_users.AddPicture("Group!")

dw_report.of_settransobject(gnv_app.inv_trans)
This.of_SetResize(True)
inv_resize.of_SetOrigSize(dw_report.x+dw_report.width+4,dw_report.y+dw_report.height+4)
inv_resize.of_register( dw_report, inv_resize.scalerightbottom)


end event

event pfc_postopen;call super::pfc_postopen;
long li_cnt,li_row
integer li_picture
string ls_entry
n_ds lds_users

dw_report.setfocus()
lds_users = create n_ds
lds_users.dataobject = 'd_pfcsecurity_users'
lds_users.of_settransobject(gnv_app.inv_trans)

li_cnt = lds_users.retrieve() // populate the users drop down list box
for li_row = 1 to li_cnt
	if lds_users.object.user_type[li_row] = 0 then
		li_picture = 1
	else
		li_picture = 2
	end if
	ls_entry = lds_users.object.name[li_row] +' : '+lds_users.object.description[li_row] 
	ddplb_users.additem(ls_entry,li_picture)
next

destroy lds_users
dw_report.setfocus() // set focus here so that the message router can see the datawindow
ddplb_users.setfocus()
end event

event pfc_print;call w_sheet::pfc_print;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_print
//
//	Arguments: None
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Ensure that the datawindow gets the pfc_print message. It might 
//					not if it is not the current control on the window
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the GNU Lesser General
 * Public License Version 2.1, February 1999
 *
 * http://www.gnu.org/copyleft/lesser.html
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see http://pfc.codexchange.sybase.com
*/
//
//////////////////////////////////////////////////////////////////////////////
return dw_report.event pfc_print()

end event

event pfc_printimmediate;call w_sheet::pfc_printimmediate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_printimmediate
//
//	Arguments: None
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Ensure that the datawindow gets the pfc_printimmediate message. It might 
//					not if it is not the current control on the window
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the GNU Lesser General
 * Public License Version 2.1, February 1999
 *
 * http://www.gnu.org/copyleft/lesser.html
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see http://pfc.codexchange.sybase.com
*/
//
//////////////////////////////////////////////////////////////////////////////
return dw_report.event pfc_printimmediate()

end event

type dw_report from u_dw within w_pfcsecurity_reportuser
int X=14
int Y=112
int Width=2706
int Height=1364
int TabOrder=10
string DataObject="d_pfcsecurity_report_by_user"
end type

event constructor;call super::constructor;ib_rmbmenu = false // turn off RMB support
end event

type ddplb_users from dropdownpicturelistbox within w_pfcsecurity_reportuser
event selectionchanged pbm_cbnselchange
int X=366
int Y=12
int Width=905
int Height=1076
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
long PictureMaskColor=12632256
end type

event selectionchanged;// save off the selected user
string ls_user
ls_user = this.text(index)
ls_user = trim(left(ls_user,pos(ls_user,':') - 1))

dw_report.retrieve(ls_user)
end event

type st_1 from u_st within w_pfcsecurity_reportuser
int X=46
int Y=28
int Width=361
string Text="Users/Groups"
long TextColor=33554432
long BackColor=77956459
end type

