#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 2
SendMode "Input"

AdminNotification()

class AdminNotification {
    __New() {
        if !A_IsAdmin
            MsgBox("Some features may require admin to work.", "Notification")
    }
}

start := Gui("+ToolWindow -Caption +AlwaysOnTop", "Startup for unfinished") 
start.BackColor := "0x161B17" 
start.AddText("x0 y0 w500 h2 Background0x0078D4", "") 
start.AddText("x0 y0 w2 h210 Background0x0078D4", "") 
start.AddText("x0 y198 w500 h2 Background0x0078D4", "") 
start.AddText("x498 y0 w2 h210 Background0x0078D4", "") 
start.SetFont("s20", "Segoe UI") 
start.AddText("x0 y30 w500 +Center cWhite +BackgroundTrans", "Welcome " A_Username " Enjoy!")
start.AddText("x82 y70 w350 h2 Background0x0078D4", "") 
start.SetFont("s14") 
start.AddText("x167 y85 cWhite +BackgroundTrans", "Full of useful tools!") 
start.SetFont("s12") 
linkdiscord2 := start.AddText("x186 y125 c0078D4", "Join the discord!") 
linkdiscord2.OnEvent("Click", (*) => Run("https://discord.gg/yKk2wf3rQG"))
start.Show("w500 h200 NA")
FadeIn(start, 250)
Sleep(850)
start.Destroy()

global frozenWindows := Map()
global lastHotkey := ""
global lastHotkey2 := ""
global lastHotkey3 := ""
global lastHotkey4 := ""
global lastHotkey5 := ""
global lastHotkey6 := ""
global lastHotkey7 := ""
global lastHotkey8 := ""
global PixelsFor90 := 0
global mygui := Gui("+AlwaysOnTop -Caption +ToolWindow", "Classic's GUI")
global Edit1 := mygui.AddEdit("x75 y25 r1 w60", "~XButton2")
global PixelsWallhop := mygui.AddEdit("x135 y25 r1 w60", "45")
global Edit2 := mygui.AddEdit("x97 y48 r1 w98", "G")
global Edit3 := mygui.AddEdit("x75 y73 r1 w120", "F1")
global Edit4 := mygui.AddEdit("x85 y98 r1 w110", "R")
global Edit5 := mygui.AddEdit("x85 y123 r1 w110", "F")
global Edit6 := mygui.AddEdit("x95 y148 r1 w50", "H")
global AutoClickerWait := mygui.AddEdit("x145 y148 r1 w50", "50")
global ChatMessage3 := mygui.AddEdit("x170 y173 r1 w25", "GG!")
global ChatMessage2 := mygui.AddEdit("x145 y173 r1 w25", "GTG")
global ChatMessage1 := mygui.AddEdit("x120 y173 r1 w25", "BRB")
global Edit7 := mygui.AddEdit("x95 y173 r1 w25", "Q")
global Edit8 := mygui.AddEdit("x318 y23 r1 w50", "T")
mygui.SetFont("s15")
global MacroSettings := mygui.AddText("+BackgroundTrans cWhite x373 y20", "⚙️")
global SendKey := ""
global ToggleLock := false
global LastToggleTime := 0
global SendClick := ""
global MacroBeingPlayed := []
global IsVisible := true

mygui.SetFont("s13 bold", "Segoe UI")
Button1 := mygui.AddText("cRed +BackgroundTrans x485 y0", "X")
mygui.SetFont("s15 bold", "Cascadia Mono")
TitleBar := mygui.AddText("c0C0705 w500 h20 +BackgroundTrans x0 y0", "")
TitleBar.OnEvent("Click", StartDrag)
mygui.BackColor := "0C0705"
mygui.SetFont("cWhite")
Button1.OnEvent("Click", (*) => ExitApp())
mygui.AddText("x45 y-5", "- Classic's GUI")
mygui.SetFont("s15 norm", "Segoe UI")
mygui.OnEvent("Close", (*) => ExitApp())
mygui.SetFont("s10")
Checkbox1 := mygui.AddCheckBox("x4 y25", "Wallhop")
Checkbox2 := mygui.AddCheckBox("x4 y50", "EyeDropper")
Checkbox2.OnEvent("Click", ToggleHotkeys2)
mygui.AddText("x4 y75", "Toggle GUI")
Checkbox1.OnEvent("Click", ToggleHotkeys)
Checkbox3 := mygui.AddCheckBox("x4 y100", "Lagswitch")
Checkbox3.OnEvent("Click", ToggleHotkeys3)
Checkbox4 := mygui.AddCheckBox("x4 y125", "Tab Glitch")
Checkbox4.OnEvent("Click", ToggleHotkeys4)
Checkbox5 := mygui.AddCheckBox("x4 y150", "AutoClicker")
Checkbox5.OnEvent("Click", ToggleHotkeys5)
Checkbox6 := mygui.AddCheckBox("x4 y175", "QuickChat")
Checkbox6.OnEvent("Click", ToggleHotkeys6)
Checkbox7 := mygui.AddCheckbox("x210 y25", "MacroCreator")
Checkbox7.OnEvent("Click", ToggleHotkeys7)
MacroSettings.OnEvent("Click", OpenMacroMaker)
mygui.AddText("x0 y0 w500 h2 Background0x0078D4", "")
mygui.AddText("x0 y20 w500 h2 Background0x0078D4", "")
mygui.AddText("x0 y0 w2 h210 Background0x0078D4", "")
mygui.AddText("x0 y198 w500 h2 Background0x0078D4", "")
mygui.AddText("x498 y0 w2 h210 Background0x0078D4", "")
mygui.AddText("x205 y20 w2 h180 Background0x0078D4", "")
mygui.AddText("x405 y20 w2 h180 Background0x0078D4", "")
linkdiscord := mygui.AddText("x415 y175 w140 h30 c0078D4 BackgroundTrans", "Join Discord")
linkdiscord.OnEvent("Click", (*) => Run("https://discord.gg/yKk2wf3rQG"))
mygui.AddText("x415 y190 w75 h2 c0078D4 Backgroundc0078D4", "")
mygui.Show("w500 h200")

Edit3.OnEvent("Change", AlwaysActive)
AlwaysActive(Edit3)

Hotkey(Edit3.Value, ToggleGUI, "On")

ToolTip("ClassicGui`nClassic GUI Launched Successfully!`nSome keybinds might need the toggle to be reloaded to change keybinds.`ndiscord.gg/yKk2wf3rQG`njoin da discord")
SetTimer () => ToolTip(), -4500

Wallhop(*) {
    SetDefaultMouseSpeed(1)
    MouseGetPos(&x, &y)
    MouseMove(x + PixelsWallhop.Value, y)
    Sleep(25)
    MouseGetPos(&x, &y)
    MouseMove(x - PixelsWallhop.Value, y)
}

global CurrentMacro := []

OpenMacroMaker(*) {
MacroCreatorGUI := Gui("+AlwaysOnTop -Caption +ToolWindow", "Classic Macro Maker")
MacroCreatorGUI.SetFont("s20 cWhite", "Cascadia Mono")
XCloseBtn := MacroCreatorGUI.AddText("x480 y8 w30 h30 cRed", "✕")
title2 := MacroCreatorGUI.AddText("+BackgroundTrans x0 y8 w520 h35 Center", "- Classic's Macro Creator")
title2.OnEvent("Click", StartDrag2.Bind(MacroCreatorGUI))
MacroCreatorGUI.SetFont("s10", "Segoe UI")
MacroCreatorGUI.BackColor := "0x161B17"
MacroActions := MacroCreatorGUI.AddListView("-Multi r20 w700 x20 y55 w480 h280 Background0x161B17", ["#", "Type", "Value", "Delay"])
MacroActions.ModifyCol(1, 40)
MacroActions.ModifyCol(2, 120)
MacroActions.ModifyCol(3, 180)
MacroActions.ModifyCol(4, 100)
XCloseBtn.OnEvent("Click", (*) => MacroCreatorGUI.Destroy())
BtnSaveMacro := CreateOutlinedButton(MacroCreatorGUI, 120, 390, 86, 20, "Save")
BtnLoadMacro := CreateOutlinedButton(MacroCreatorGUI, 230, 390, 86, 20, "Load")
BtnSaveMacro.OnEvent("Click", (*) => SaveMacro())
BtnLoadMacro.OnEvent("Click", (*) => LoadMacro(MacroActions))
BtnAddKey := CreateOutlinedButton(MacroCreatorGUI, 10, 350, 86, 20, "Add Key")
BtnAddClick := CreateOutlinedButton(MacroCreatorGUI, 120, 350, 86, 20, "Add Click")
BtnAddDelay := CreateOutlinedButton(MacroCreatorGUI, 230, 350, 86, 20, "Add Delay")
BtnDelSlcted := CreateOutlinedButton(MacroCreatorGUI, 340, 350, 86, 20, "Delete")
BtnClearMacro := CreateOutlinedButton(MacroCreatorGUI, 10, 390, 86, 20, "Clear")
BtnApplyMacro := CreateOutlinedButton(MacroCreatorGUI, 390, 420, 86, 20, "Apply Changes")
BtnAddKey.OnEvent("Click", (*) => AddKey(MacroActions))
BtnAddClick.OnEvent("Click", (*) => AddClick(MacroActions))
BtnAddDelay.OnEvent("Click", (*) => AddDelay(MacroActions))
BtnDelSlcted.OnEvent("Click", (*) => DelSlcted(MacroActions))
BtnClearMacro.OnEvent("Click", (*) => ClearMacro(MacroActions))
BtnApplyMacro.OnEvent("Click", (*) => ApplyMacroChanges(MacroActions))
MacroCreatorGUI.AddText("x0 y0 w520 h2 Background0x0078D4", "")
MacroCreatorGUI.AddText("x0 y0 w2 h460 Background0x0078D4", "")
MacroCreatorGUI.AddText("x0 y458 w520 h2 Background0x0078D4", "")
MacroCreatorGUI.AddText("x518 y0 w2 h460 Background0x0078D4", "")
MacroCreatorGUI.Show("w520 h460")

AddKey(MacroActions) {
    global CurrentMacro
    ib := InputBox("Key (a, {Enter}, etc)", "Key")
    if (ib.Result != "OK" || ib.Value = "")
        return

    step := Map()
    step["type"] := "Key"
    step["value"] := ib.Value
    step["delay"] := 50

    CurrentMacro.Push(step)
    Refresh(MacroActions)
}

AddClick(MacroActions) {
    global CurrentMacro
    ib := InputBox("L or R", "Click", , "L")
    if (ib.Result != "OK")
        return

    step := Map()
    step["type"] := "Mouse"
    step["value"] := (StrUpper(ib.Value)="R" ? "Right" : "Left")
    step["delay"] := 50

    CurrentMacro.Push(step)
    Refresh(MacroActions)
}

AddDelay(MacroActions) {
    global CurrentMacro
    ib := InputBox("Delay ms", "Delay", , "100")
    if (ib.Result != "OK" || !IsNumber(ib.Value))
        return

    step := Map()
    step["type"] := "Delay"
    step["value"] := ib.Value+0
    step["delay"] := 0

    CurrentMacro.Push(step)
    Refresh(MacroActions)
}

DelSlcted(MacroActions) {
    global CurrentMacro
    row := MacroActions.GetNext()
    if (!row)
        return
    CurrentMacro.RemoveAt(row)
    Refresh(MacroActions)
}

ClearMacro(MacroActions) {
    global CurrentMacro
    CurrentMacro := []
    Refresh(MacroActions)
}

Refresh(MacroActions) {
    global CurrentMacro
    MacroActions.Delete()
    for i, step in CurrentMacro {
        MacroActions.Add("", i, step["type"], step["value"], step["delay"])
    }
}

StartDrag2(MacroCreatorGUI, *) {
    PostMessage(0xA1, 2, 0, , MacroCreatorGUI)
}
CreateOutlinedButton(gui, x, y, w, h, text) {

    btn := gui.AddText("x" x " y" y " w" w " h" h " Center cWhite Background0x161B17", text)

    gui.AddText("x" x " y" y " w2 h" h " Background0x0078D4", "")

    gui.AddText("x" x+w-2 " y" y " w2 h" h " Background0x0078D4", "")

    gui.AddText("x" x " y" y " w" w " h2 Background0x0078D4", "")

    gui.AddText("x" x " y" y+h-2 " w" w " h2 Background0x0078D4", "")

    return btn
}
ApplyMacroChanges(MacroActions, *) {
    global CurrentMacro, MacroBeingPlayed, MacroRunning, Edit8

    MacroBeingPlayed := []
    for step in CurrentMacro
        MacroBeingPlayed.Push(step)

    ToolTip("Macro applied! Press " Edit8.Value " to play.")
    SetTimer(() => ToolTip(), -2500)
}
SaveMacro() {
    global CurrentMacro

    path := FileSelect("S", , "Save Macro", "Text (*.txt)")
    if !path
        return

    content := ""
    for step in CurrentMacro {
        content .= step["type"] "|" step["value"] "|" step["delay"] "`n"
    }

    FileAppend(content, path)

    ToolTip("Macro saved!")
    SetTimer(() => ToolTip(), -1500)
}
LoadMacro(MacroActions) {
    global CurrentMacro

    path := FileSelect(1, , "Load Macro", "Text (*.txt)")
    if !path
        return

    CurrentMacro := []

    loop read path {
        parts := StrSplit(A_LoopReadLine, "|")
        if parts.Length < 3
            continue

        step := Map()
        step["type"] := parts[1]
        step["value"] := parts[2]
        step["delay"] := parts[3] + 0

        CurrentMacro.Push(step)
    }

    Refresh(MacroActions)

    ToolTip("Macro loaded!")
    SetTimer(() => ToolTip(), -1500)
}
}

EyeDropper(*) {
MouseGetPos(&x, &y)
ToolTip PixelGetColor(x, y)
SetTimer () => ToolTip(), -5000
}

ToggleHotkeys(ctrl, *) {
    global lastHotkey
    if lastHotkey
        Hotkey(lastHotkey, Wallhop, "Off")

    if ctrl.Value {
        Hotkey(Edit1.Value, Wallhop, "On")
        lastHotkey := Edit1.Value
    } else {
        lastHotkey := ""
    }
}

ToggleHotkeys2(ctrl, *) {
    global lastHotkey2
    if lastHotkey2
        Hotkey(lastHotkey2, EyeDropper, "Off")

    if ctrl.Value {
        Hotkey(Edit2.Value, EyeDropper, "On")
        lastHotkey2 := Edit2.Value
    } else {
        lastHotkey2 := ""
    }
}

AlwaysActive(ctrl, *) {
    global lastHotkey3

    if lastHotkey3
        Hotkey(lastHotkey3, ToggleGUI, "Off")

    newKey := ctrl.Value

    if newKey != "" {
        Hotkey(newKey, ToggleGUI, "On")
        lastHotkey3 := newKey
    }
}

ToggleHotkeys3(ctrl, *) {
    global lastHotkey4
    if lastHotkey4
        Hotkey(lastHotkey4, LagSwitchBurst, "Off")

    if ctrl.Value {
        Hotkey(Edit4.Value, LagSwitchBurst, "On")
        lastHotkey4 := Edit4.Value
    } else {
        lastHotkey4 := ""
    }
}



StartDrag(*) {
    PostMessage(0xA1, 2,,, "A")
}

ToggleGUI(*) {
    global isVisible, mygui

    isVisible := !isVisible

    if (isVisible) {
        mygui.Show("NA w500 h200")
    } else {
        mygui.Hide()
    }
}

ToggleHotkeys4(ctrl, *) {
    global lastHotkey5
    if lastHotkey5
        Hotkey(lastHotkey5, TabFreezeControl, "Off")

    if ctrl.Value {
        Hotkey(Edit5.Value, TabFreezeControl, "On")
        lastHotkey5 := Edit5.Value
    } else {
        lastHotkey5 := ""
    }
}

LagSwitchBurst(*) {
    static LagToggle := false

    if !FileExist("LagRuleCreated.txt") {
        Run("netsh advfirewall firewall add rule name=RobloxLagSwitch dir=out action=block protocol=UDP", , "Hide")
        FileAppend("1", "LagRuleCreated.txt")
    }

    if !LagToggle {
        Run("netsh advfirewall firewall set rule name=RobloxLagSwitch new enable=yes", , "Hide")
        ToolTip("ON")
    } else {
        Run("netsh advfirewall firewall set rule name=RobloxLagSwitch new enable=no", , "Hide")
        ToolTip()
    }

    LagToggle := !LagToggle
}

global FrozenPID := 0
global FrozenHandle := 0

TabFreezeControl(*) {
    global FrozenPID, FrozenHandle, Edit5

    if !WinActive("Roblox")
        return

    pid := WinGetPID("A")
    if !pid
        return

    if !FrozenPID {
        h := DllCall("OpenProcess", "UInt", 0x1F0FFF, "Int", 0, "UInt", pid, "Ptr")
        if !h
            return

        DllCall("ntdll.dll\NtSuspendProcess", "Ptr", h)

        FrozenPID := pid
        FrozenHandle := h

        Hotkey("*" Edit5.Value " Up", UnfreezeProcess, "On")
    }
}

UnfreezeProcess(*) {
    global FrozenPID, FrozenHandle, Edit5

    if FrozenHandle
        DllCall("ntdll.dll\NtResumeProcess", "Ptr", FrozenHandle)

    FrozenPID := 0
    FrozenHandle := 0

    Hotkey("*" Edit5.Value " Up", UnfreezeProcess, "Off")
}

global AutoClickerActive := false

AutoClickLoop(*) {
    global AutoClickerActive
    if AutoClickerActive
        Click()
}

ToggleHotkeys5(ctrl, *) {
    global lastHotkey6, Edit6, AutoClickerActive, AutoClickerInterval
    if lastHotkey6
        Hotkey(lastHotkey6, AutoClickLoop, "Off")

    if ctrl.Value {
        Hotkey(Edit6.Value, ToggleAutoClicker, "On")
        lastHotkey6 := Edit6.Value
    } else {
        lastHotkey6 := ""
    }
}

ToggleAutoClicker(*) {
    global AutoClickerActive, AutoClickerInterval, AutoClickerWait

    AutoClickerInterval := AutoClickerWait.Value

    AutoClickerActive := !AutoClickerActive
    if AutoClickerActive
        SetTimer(AutoClickLoop, AutoClickerInterval)
    else
        SetTimer(AutoClickLoop, 0)
}

ToggleHotkeys6(ctrl, *) {
    global lastHotkey7, Edit7

    if lastHotkey7
        Hotkey(lastHotkey7, QuickChatHandler, "Off")

    if ctrl.Value {
        hk := "*" Edit7.Value
        Hotkey(hk, QuickChatHandler, "On")
        lastHotkey7 := hk
    } else {
        lastHotkey7 := ""
    }
}

ToggleHotkeys7(ctrl, *) {
    global lastHotkey8, Edit8

    if lastHotkey8
        Hotkey(lastHotkey8, PlayMacroCreated, "Off")

    if ctrl.Value {
        hk := "*" Edit8.Value
        Hotkey(hk, PlayMacroCreated, "On")
        lastHotkey8 := hk
    } else {
        lastHotkey8 := ""
    }
}


QuickChatHandler(*) {
    global ChatMessage1, ChatMessage2, ChatMessage3, Edit7

    BlockNumberKeys(true)

    ToolTip("1: " ChatMessage1.Value "`n2: " ChatMessage2.Value "`n3: " ChatMessage3.Value)

    key := Edit7.Value

    while GetKeyState(key, "P") {
        if GetKeyState("1", "P") {
            SendChat(ChatMessage1.Value)
            break
        }
        if GetKeyState("2", "P") {
            SendChat(ChatMessage2.Value)
            break
        }
        if GetKeyState("3", "P") {
            SendChat(ChatMessage3.Value)
            break
        }
        Sleep(10)
    }

    ToolTip()
    BlockNumberKeys(false)
}

BlockNumberKeys(state) {
    if state {
        Hotkey("*1", BlockInputKey, "On")
        Hotkey("*2", BlockInputKey, "On")
        Hotkey("*3", BlockInputKey, "On")
    } else {
        Hotkey("*1", BlockInputKey, "Off")
        Hotkey("*2", BlockInputKey, "Off")
        Hotkey("*3", BlockInputKey, "Off")
    }
}

BlockInputKey(*) {
}

SendChat(msg) {
    Send("/")
    Sleep(50)
    SendText(msg)
    Sleep(50)
    Send("{Enter}")
}

global MacroRunning := false

PlayMacroCreated(*) {
    global MacroBeingPlayed, MacroRunning, ToggleLock, LastToggleTime

    if (A_TickCount - LastToggleTime < 150)
        return
    LastToggleTime := A_TickCount

    if ToggleLock
        return
    ToggleLock := true

    if MacroRunning {
        MacroRunning := false
        ReleaseAllKeys()
        SetTimer(() => ToolTip(), -1)
        ToggleLock := false
        return
    }

    if !MacroBeingPlayed.Length {
        ToolTip("No macro loaded!")
        SetTimer(() => ToolTip(), -2000)
        ToggleLock := false
        return
    }

    MacroRunning := true
    ToolTip("Macro running... Press hotkey again to stop.")
    ToggleLock := false

    while MacroRunning {
        for step in MacroBeingPlayed {
            if !MacroRunning
                break

            type := step["type"]
            value := step["value"]
            delay := step["delay"]

            if type = "Key" {
                if RegExMatch(value, "^{.*}$")
                    Send(value)
                else
                    SendText(value)
            }
            else if type = "Mouse" {
                if (value = "Left")
                    Click("Left")
                else if (value = "Right")
                    Click("Right")
            }
            else if type = "Delay" {
                SleepSafe(value)
                continue
            }

            if delay > 0
                SleepSafe(delay)
        }
    }

    ReleaseAllKeys()
}

SleepSafe(ms) {
    global MacroRunning
    elapsed := 0
    interval := 10

    while (elapsed < ms) {
        if !MacroRunning
            break
        Sleep(interval)
        elapsed += interval
    }
}

FadeIn(gui, duration := 250, *) {
    gui.Show("NA")
    hwnd := gui.Hwnd
    WinSetTransparent(0, "ahk_id " hwnd)

    steps := 30
    stepDelay := duration // steps
    trans := 0

    loop steps {
        trans += 255 // steps
        WinSetTransparent(trans, "ahk_id " hwnd)
        Sleep(stepDelay)
    }

    WinSetTransparent(255, "ahk_id " hwnd)
}

ReleaseAllKeys() {
    keys := [
        "w","a","s","d","q","e","r","t","y","u","i","o","p",
        "f","g","h","j","k","l","z","x","c","v","b","n","m",
        "1","2","3","4","5","6","7","8","9","0",
        "Shift","Ctrl","Alt","LShift","RShift","LCtrl","RCtrl","LAlt","RAlt",
        "Space","Enter","Tab","Esc","Backspace",
        "Up","Down","Left","Right"
    ]

    for key in keys {
        Send("{" key " up}")
    }
}

FadeOut(gui, duration := 250, *) {
    hwnd := gui.Hwnd

    steps := 30
    stepDelay := duration // steps
    trans := 255

    loop steps {
        trans -= 255 // steps
        WinSetTransparent(trans, "ahk_id " hwnd)
        Sleep(stepDelay)
    }

    WinSetTransparent(0, "ahk_id " hwnd)
    gui.Hide()
}