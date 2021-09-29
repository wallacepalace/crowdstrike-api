# --------------------------------------------------------------
# Script para executar comandos em massa em grupos de máquinas -
# --------------------------------------------------------------

# Importação do módulo necessário PSFalcon
Install-Module -Name PSFalcon -Scope CurrentUser
Import-Module -Name PSFalcon

# Autenticação com a console (API e Secret)
# Na parte de "-Cloud" você precisa alterar para onde sua console está criada (us-1, us-2, eu, etc...)
Request-FalconToken -ClientId API-KEY -ClientSecret API-SECRET-KEY -Cloud us-2

# Formação dos detalhes do grupo, hostname e filtro para o payload
# O valor do "GroupId" fica na parte de "groups" na console, basta clicar em um grupo e verá na URL um ID de 32 dígitos.
# Também é possível fazer a instalação por hostnames usando wildcards. Exemplo: "Maquina-*", isso instalará nas máquinas (Maquina-01, Maquina-02, etc.)

$Hostname = ""
$GroupId = ""
$Platform = "Linux"
$Filter = ""
if ($Hostname.Length -gt 0) {
  if ($Filter.Length -gt 0) {
    $Filter += "+"
  }
  $Filter += "hostname: '$($Hostname)'"
}
if ($GroupId.Length -gt 0) {
  if ($Filter.Length -gt 0) {
    $Filter += "+"
  }
  $Filter += "groups: '$($GroupId)'"
}
if ($Platform.Length -gt 0) {
  if ($Filter.Length -gt 0) {
    $Filter += "+"
  }
  $Filter += "platform_name: '$($Platform)'"
}

# Variável que carrega o comando que será executado na máquina. Obs: não precisa de aspas
$command = cat /etc/os-release

# Puxa os detalhes das variáveis acima e carregam no payload seguinte
Get-FalconHost -Detailed -Filter $Filter -OutVariable HostIds | Out-Null

# Payload que executa o comando final com as variáveis preload
Invoke-FalconRTR -Command runscript -Arguments -Raw="'$($command)'" -HostId $HostIds.device_id | ConvertTo-Csv >> resultado-cmd-grupo.csv