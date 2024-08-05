#SingleInstance Force

; caps2esc
$CapsLock::Send "{Esc}"
$Esc::Send "{``}"
$+Esc::Send "{~}"

; Media
#=::Send "{Volume_Up}"
#-::Send "{Volume_Down}"

; Backlight
#Up::Brightness("+1")
#Down::Brightness("-1")

; Functions
Brightness(Offset) {
    static wmi := ComObjGet("winmgmts:\\.\root\WMI")
        , last := wmi.ExecQuery("SELECT * FROM WmiMonitorBrightness").ItemIndex(0).CurrentBrightness
    level := Min(100, Max(1, last + Offset))
    if (level != last) {
        last := level
        wmi.ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods").ItemIndex(0).WmiSetBrightness(0, level)
    }
}
