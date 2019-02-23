function pathLikeFish {
    $pathSegments = [string[]]([string]$(Get-Location)).Replace($HOME, "~").Split("\")
    return [System.Linq.Enumerable]::Aggregate($pathSegments, "", [Func[string, string, string]] {
            param($acc, $curr)

            if ($pathSegments.IndexOf($curr) + 1 -eq $pathSegments.Length) {
                return $acc + $curr
            }

            if ($curr -match "^[^a-zA-Z0-9]") {
                if ($curr.Length -ge 2) {
                    return $acc + $curr.Substring(0, 2) + "\"
                }
                else {
                    return $acc + $curr.Substring(0, $curr.Length) + "\"
                }

            }

            return $acc + $curr.Substring(0, 1) + "\"
        })
}
