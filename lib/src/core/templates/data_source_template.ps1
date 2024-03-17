# Obter o nome do projeto Flutter
$projectName = (Get-Content "pubspec.yaml" | Select-String "name:" | ForEach-Object { $_ -replace '^\s*name:\s*','' }) -replace '\s'

# Solicitar o nome da pasta do usuário
$pastaNome = Read-Host "Digite o nome da pasta"

# Converter a primeira letra de cada palavra do nome da pasta para maiúscula
$nomePastaMaiusculo = ($pastaNome -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

# Juntar as partes em uma única string
$nomePastaMaiusculo = $nomePastaMaiusculo -join ""

# Caminho completo da nova pasta
$caminhoPasta = Join-Path -Path "lib\src\data\data_sources" -ChildPath $pastaNome

# Criar a nova pasta
New-Item -Path $caminhoPasta -ItemType Directory -Force

# Template do data_source_impl.dart
$dataSourceImplTemplate = @"
import 'package:$projectName/src/data/data_sources/${pastaNome}/${pastaNome}_data_source.dart';

class ${nomePastaMaiusculo}DataSourceImpl implements ${nomePastaMaiusculo}DataSource {}
"@

# Template do data_source.dart
$dataSourceTemplate = @"
abstract class ${nomePastaMaiusculo}DataSource {}
"@

# Caminho completo para a pasta 'impl' dentro da pasta criada
$caminhoImpl = Join-Path -Path $caminhoPasta -ChildPath "impl"

# Criar a pasta 'impl' dentro da pasta criada
New-Item -Path $caminhoImpl -ItemType Directory -Force

# Caminho completo para o arquivo data_source_impl.dart
$caminhoDataSourceImpl = Join-Path -Path $caminhoImpl -ChildPath "${pastaNome}_data_source_impl.dart"

# Criar o arquivo data_source_impl.dart com base no template
$dataSourceImplTemplate | Set-Content -Path $caminhoDataSourceImpl

# Caminho completo para o arquivo data_source.dart
$caminhoDataSource = Join-Path -Path $caminhoPasta -ChildPath "${pastaNome}_data_source.dart"

# Criar o arquivo data_source.dart com base no template
$dataSourceTemplate | Set-Content -Path $caminhoDataSource