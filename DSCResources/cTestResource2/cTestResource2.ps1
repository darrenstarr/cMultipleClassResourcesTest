[DSCResource()]
class cTestResource2
{
    [DSCProperty(Key,Mandatory)]
    [string] $Name

    [cTestResource2]Get() {
        return [cTestResource2] @{
            Name = $this.Name
        }
    }

    [void] Set() {

    }

    [bool] Test() {
        return $true
    }
}
