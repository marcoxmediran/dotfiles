Offset := 20
Speed := 0

; Mouse Movement
!h::MouseMove(Offset * -1, 0, Speed, "R")
!j::MouseMove(0, Offset, Speed, "R")
!k::MouseMove(0, Offset * -1, Speed, "R")
!l::MouseMove(Offset, 0, Speed, "R")

; Clicks
^!h::MouseClick("left", , , , , , "R")
^!l::MouseClick("right", , , , , , "R")

; Scroll
^!k::MouseClick("WheelUp", , , ,)
^!j::MouseClick("WheelDown", , , ,)
