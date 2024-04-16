#Requires AutoHotkey v2.0
#SingleInstance Force
TraySetIcon("Asissts/steam wallpapers finders.ico",1,)

;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 18:06:24  on 10/4/2024   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}


traySetIcon("Asissts/steam wallpapers finders.ico")



msgboxWithTrayIcon("Hello, World!" , , "0x2000")


MsgboxWithTrayIcon(text?, title?, options?)    { ;  ahk2.0
    myGui := gui("+LastFound +OwnDialogs")
    winSetTransparent(0)
    myGui.show()
    result := msgbox(text?, title?, options?)
    myGui.destroy()
    return result
}


MsgBoxEx("sss" , )




MsgBoxEx(text?, title?, options?, iconFile := A_IconFile ? A_IconFile : A_AhkPath, iconNumber := A_IconNumber ? A_IconNumber : 1) {
    winTitle := Format("{1} ahk_class #32770", title?)
    OnMessage(0x0044, SetTitleBarIcon)
    result := MsgBox(text?, title?, options?)
    return result

    SetTitleBarIcon(*) {
        DetectHiddenWindows(true)
        DetectHiddenText(true)
        iconHandle := LoadPicture(iconFile, "w24 h24 Icon" iconNumber, &HandleType)
        SendMessage(WM_SETICON := 0x0080, 0, iconHandle, control?, winTitle, text ?? "Press OK to continue.")
        OnMessage(0x0044, SetTitleBarIcon, 0)
        DetectHiddenWindows(false)
        DetectHiddenText(false)
    }
}





















A_TrayMenu.Add()  ; Creates a separator line.
A_TrayMenu.Add("Item1", MenuHandler1)  ; Creates a new menu item.

MenuHandler1(ItemName, ItemPos, MyMenu) {
    MsgBox "You selected " ItemName " (position " ItemPos ")"
}

A_TrayMenu.Add("Helle", (*)=>  mss("s") )
mss(s,*){
    MsgBox (s)
}

MyMenu := Menu()
MyMenu.Add "Item 1", MenuHandler
MyMenu.Add "Item 2", MenuHandler
MyMenu.Add  ; Add a separator line.

; Create another menu destined to become a submenu of the above menu.
Submenu1 := Menu()
Submenu1.Add "Item A", MenuHandler
Submenu1.Add "Item B", MenuHandler

; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
MyMenu.Add "My Submenu", Submenu1

MyMenu.Add  ; Add a separator line below the submenu.
MyMenu.Add "Item 3", MenuHandler  ; Add another menu item beneath the submenu.

MenuHandler(Item, *) {
    MsgBox "You selected " Item
}
{
    for each, arg in A_Args
    output .= arg "`n"
}

;==fix null value
output := output??0



startGui()
startGui(){
    m := Gui()

    m.Add("Text",,"Hi")
    m.Add("Button","w211 h112" ,"Click")
    m.Show()
}


F3::{

    steamURL := unset
    steamWindow := unset
    
    try {
        
        steamWindow .= WinGetTitle("A")
        steamWindow .= "`n`n"
        steamWindow .= WinGetProcessName("A")
        
    } catch Error  {
        
        Sleep(1000)
        steamWindow .= WinGetTitle("A")
        steamWindow .= "`n`n"
        steamWindow .= WinGetProcessName("A")
    }
    ; }finally{
    ;     SoundBeep
    ;     SetTitleMatchMode(3)
    ;     steamWindow := WinGetTitle("Steam",,"ahk_exe steamwebhelper.exe") 

    ; }

    steamURL:= RegExMatchInfo
    if RegExMatch(steamWindow,"i)https:\/\/store\.steampowered\.com\/app\/[0-9]+", &steamURL){
        steamURL__id := steamURL[0]
        steamURL__id := RegExReplace(steamURL__id,"i)https:\/\/store\.steampowered\.com\/app\/","")

        ;steamProfileURL := "https://steamcommunity.com/market/search?q=&category_753_Event%5B%5D=any&category_753_Game%5B%5D=tag_app_" steamURL__id "&category_753_item_class%5B%5D=tag_item_class_3&appid=753"
        steamProfileURL := "https://steamcommunity.com/market/search?q=&category_753_Event%5B0%5D=any&category_753_Game%5B0%5D=tag_app_" steamURL__id "&category_753_item_class%5B0%5D=tag_item_class_3&appid=753"

        run steamProfileURL
    }else if RegExMatch(steamWindow ,"i)https:\/\/steamcommunity\.com\/market\/search.*&category.*" ,&steamURL ){
        steamURL__id := steamURL[0]
        steamURL__id := RegExReplace(steamURL__id,"i)_item_class.*[1-9]*","")
        Run steamURL__id

    }else if RegExMatch(steamURL ,"i)https:\/\/steamcommunity\.com\/market\/search\?q=&category_753_Event%5B0%5D=any&category_753_Game%5B0%5D=tag_app_[0-9]+&appid=753" ,&steamURL ){

        MsgBox "I'm lazy to code"


    }
    else if RegExMatch(steamWindow ,"i)https*:\/\/") {
        MsgBox "we couldn't detect steam webstore"
    }
    else{
        MsgBox "didn't found Any window.`n'Make sure you installed a URL pulgin top your browser with full URL"
    }
    
}

