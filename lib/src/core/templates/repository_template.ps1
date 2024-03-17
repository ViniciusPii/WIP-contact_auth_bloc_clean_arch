# Obter o nome do projeto Flutter
$projectName = (Get-Content "pubspec.yaml" | Select-String "name:" | ForEach-Object { $_ -replace '^\s*name:\s*','' }) -replace '\s'

# Solicitar o nome da pasta do usuário
$pastaNome = Read-Host "Digite o nome da pasta"

# Converter a primeira letra de cada palavra do nome da pasta para maiúscula
$nomePastaMaiusculo = ($pastaNome -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

# Juntar as partes em uma única string
$nomePastaMaiusculo = $nomePastaMaiusculo -join ""

# Caminho completo da nova pasta
$caminhoPasta = Join-Path -Path "lib\src\data\repositories" -ChildPath $pastaNome

# Criar a nova pasta
New-Item -Path $caminhoPasta -ItemType Directory -Force

# Template do repository_impl.dart
$repositoryImplTemplate = @"
import 'package:$projectName/src/data/data_sources/${pastaNome}/${pastaNome}_data_source.dart';
import 'package:$projectName/src/data/repositories/${pastaNome}/${pastaNome}_repository.dart';

class ${nomePastaMaiusculo}RepositoryImpl implements ${nomePastaMaiusculo}Repository {
  ${nomePastaMaiusculo}RepositoryImpl({
    required ${nomePastaMaiusculo}DataSource dataSource,
  }) : _dataSource = dataSource;

  final ${nomePastaMaiusculo}DataSource _dataSource;
}
"@

# Template do repository.dart
$repositoryTemplate = @"
abstract class ${nomePastaMaiusculo}Repository {}
"@

# Caminho completo para a pasta 'impl' dentro da pasta criada
$caminhoImpl = Join-Path -Path $caminhoPasta -ChildPath "impl"

# Criar a pasta 'impl' dentro da pasta criada
New-Item -Path $caminhoImpl -ItemType Directory -Force

# Caminho completo para o arquivo repository_impl.dart
$caminhoRepositoryImpl = Join-Path -Path $caminhoImpl -ChildPath "${pastaNome}_repository_impl.dart"

# Criar o arquivo repository_impl.dart com base no template
$repositoryImplTemplate | Set-Content -Path $caminhoRepositoryImpl

# Caminho completo para o arquivo repository.dart
$caminhoRepository = Join-Path -Path $caminhoPasta -ChildPath "${pastaNome}_repository.dart"

# Criar o arquivo repository.dart com base no template
$repositoryTemplate | Set-Content -Path $caminhoRepository