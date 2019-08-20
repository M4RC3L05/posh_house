function pathLikeFish {
    $pathSegments = [string[]]([string]$(Get-Location)).Replace($HOME, "~").Split("\")

    $mappedPathSegments = [System.Linq.Enumerable]::Select($pathSegments, [Func[string, int, string]] {
            param($pathSlice, $index)

            if ($index + 1 -eq $pathSegments.Length) {
                return $pathSlice
            }

            if ($pathSlice -match "^[^a-zA-Z0-9]") {
                if ($pathSlice.Length -ge 2) {
                    return $pathSlice.Substring(0, 2) + "\"
                }
                else {
                    return $pathSlice.Substring(0, $pathSlice.Length) + "\"
                }

            }

            return $pathSlice.Substring(0, 1) + "\"
        })

    $finalPath = $mappedPathSegments -join ""

    return $finalPath

}
