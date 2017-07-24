[DSCResource()]
class cTestResource1
{
    [DSCProperty(Key,Mandatory)]
    [string] $Name

    [cTestResource1]Get() {
        return [cTestResource1] @{
            Name = $this.Name
        }
    }

    [void] Set() {

    }

    [bool] Test() {
        return $true
    }
}
