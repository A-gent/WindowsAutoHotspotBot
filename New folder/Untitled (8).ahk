MsgBox % GetDateFormat(160101010000000)    ; ==> Monday, 01. Januar 1601
 
GetDateFormat(Date, Format := "dddd',' dd. MMMM yyyy")
{
    VarSetCapacity(SYSTEMTIME, 16)
    , NumPut(SubStr(Date, 1, 4), SYSTEMTIME, 0, "UShort")
    , NumPut(SubStr(Date, 5, 2), SYSTEMTIME, 2, "UShort")
    , NumPut(SubStr(Date, 7, 2), SYSTEMTIME, 6, "UShort")
    size := DllCall("GetDateFormat", "UInt", 0x0400, "UInt", 0, "Ptr", &SYSTEMTIME, "Ptr", &Format, "Ptr", 0, "Int", 0)
    VarSetCapacity(buf, size * (A_IsUnicode ? 2 : 1), 0)
    if !(DllCall("GetDateFormat", "UInt", 0x0400, "UInt", 0, "Ptr", &SYSTEMTIME, "Ptr", &Format, "Str", buf, "Int", size))
        return "*" A_LastError
    return buf
}