function Get-CertificateTemplateOID
{
    <#
            .Synopsis
            returns a PKI template OID
            .DESCRIPTION
            Connects to LDAP and retrievs the OID of a given PKI template by template Common Name
            .EXAMPLE
            Get-CertificateTemplateOID -Name 'Workstation'
            .EXAMPLE
            Get-CertificateTemplateOID -Name 'DSCTemplate' -Domain contoso.com 
            .OUTPUTS
            System.String
            .NOTES
            This may require RSAT. 
    #>

    [CmdletBinding()]
    [OutputType([String])]
    Param
    (
        # Name of the template
        [Parameter(Mandatory,HelpMessage = 'Name of the template')]
        [ValidateNotNullOrEmpty()]
        [Alias('cn')]
        [string]
        $Name,

        # Domain to search (defaults to curent machines domain)
        [Parameter(Mandatory = $false, HelpMessage = 'The domain name')]
        [ValidateNotNullOrEmpty()]
        [string]
        $Domain = (Get-Domain).name
    )

    (Get-ADCertificateTemplate -Domain $domain -TemplateName $Name ).'msPKI-Cert-Template-OID'
}
