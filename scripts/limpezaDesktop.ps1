# Caminho para a pasta de destino
$pastaDestino = "C:\Users\nomeUsuario\Desktop"

# Lista de itens que você deseja manter na Área de Trabalho
$itensPermitidos = @(
    "Android Studio.lnk",
    "Insomnia.lnk",
    "Node.js.lnk",
    "GitHub Desktop.lnk"
)

# Obtém todos os itens na pasta de destino
$itensNaPasta = Get-ChildItem -Path $pastaDestino

Clear-Host

if ( $itensNaPasta.Count -eq 0) {
    Write-Host "Não foram encontrados itens no diretório"
} else {
    # Loop pelos itens na pasta e exclui aqueles que não estão na lista permitida
    foreach ($item in $itensNaPasta) {
        $nomeItem = $item.Name

        if ($itensPermitidos -notcontains $nomeItem) {
            # Se não estiver na lista permitida, exclui o item
            Remove-Item -Path $item.FullName -Recurse -Force
            Write-Host "Item '$nomeItem' foi excluído."
        }
    }
}

Write-Host ""
