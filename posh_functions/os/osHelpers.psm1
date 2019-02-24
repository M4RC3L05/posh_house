function isAdmin {
    $wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $prp = new-object System.Security.Principal.WindowsPrincipal($wid)
    $adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
    return [bool]$prp.IsInRole($adm)
}

function eyed {
    $cursorPos = $host.UI.RawUI.CursorPosition
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

    while ($true) {

        $pos = [System.Windows.Forms.Cursor]::Position
        $x = $pos.X
        $y = $pos.Y

        $map = [System.Drawing.Rectangle][System.Drawing.Rectangle]::FromLTRB($x, $y, $x + 1, $y + 1)
        $bmp = [System.Drawing.Bitmap]::new(1, 1)
        $graphics = [System.Drawing.Graphics][System.Drawing.Graphics]::FromImage($bmp)
        $graphics.CopyFromScreen($map.Location, [System.Drawing.Point]::Empty, $map.Size)
        $graphics.Dispose()
        $pixel = $bmp.GetPixel(0, 0)
        $bmp.Dispose()
        $red = $pixel.R
        $green = $pixel.G
        $blue = $pixel.B

        $hex = "#" + ($red.ToString("X2")) + ($green.ToString("X2")) + ($blue.ToString("X2"))

        [Console]::SetCursorPosition($cursorPos.X, $cursorPos.Y)
        [Console]::Write("$hex")

        if ($Host.UI.RawUI.KeyAvailable -and (3 -eq [int]$Host.UI.RawUI.ReadKey("AllowCtrlC,IncludeKeyUp,NoEcho").Character)) {
            Set-Clipboard $hex
            Write-Host "`nColor copied to clipboard"
            Remove-Variable map

            $bmp.Dispose()
            Remove-Variable bmp

            $graphics.Dispose()
            Remove-Variable graphics

            Remove-Variable pixel

            Remove-Variable red
            Remove-Variable green
            Remove-Variable blue
            break;
        }
    }
}
