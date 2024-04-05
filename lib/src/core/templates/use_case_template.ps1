# Obter o nome do projeto Flutter
$projectName = (Get-Content "pubspec.yaml" | Select-String "name:" | ForEach-Object { $_ -replace '^\s*name:\s*','' }) -replace '\s'

# Solicitar o nome da feature do usuário
$featureNome = Read-Host "Digite o nome da feature"

# Solicitar o nome do use case do usuário
$repoNome = Read-Host "Digite o nome do repository"

# Solicitar o nome do use case do usuário
$pastaNome = Read-Host "Digite o nome do use case"

# Converter a primeira letra de cada palavra do nome da pasta para maiúscula
$nomePastaMaiusculo = ($pastaNome -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

# Juntar as partes em uma única string
$nomePastaMaiusculo = $nomePastaMaiusculo -join ""

# Converter a primeira letra de cada palavra do nome da pasta para maiúscula
$featureMaiusculo = ($featureNome -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

# Juntar as partes em uma única string
$featureMaiusculo = $featureMaiusculo -join ""

# Converter a primeira letra de cada palavra do nome da pasta para maiúscula
$repoMaiusculo = ($repoNome -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

# Juntar as partes em uma única string
$repoMaiusculo = $repoMaiusculo -join ""

# Caminho completo da nova pasta
$caminhoPasta = Join-Path -Path "lib\src\features\$featureNome\domain" -ChildPath "use_cases"

# Criar a nova pasta
New-Item -Path $caminhoPasta -ItemType Directory -Force

# Template do use_case_impl.dart
$useCaseImplTemplate = @"
import 'package:${projectName}/src/features/$featureNome/data/repositories/${repoNome}_repository.dart';
import 'package:${projectName}/src/features/$featureNome/domain/use_cases/${pastaNome}_use_case.dart';

class ${nomePastaMaiusculo}UseCaseImpl implements ${nomePastaMaiusculo}UseCase {
  ${nomePastaMaiusculo}UseCaseImpl({
    required ${repoMaiusculo}Repository repository,
  }) : _repository = repository;

  final ${repoMaiusculo}Repository _repository;
}
"@

# Template do use_case.dart
$useCaseTemplate = @"
abstract class ${nomePastaMaiusculo}UseCase {}
"@

# Caminho completo para a pasta 'impl' dentro da pasta criada
$caminhoImpl = Join-Path -Path $caminhoPasta -ChildPath "impl"

# Criar a pasta 'impl' dentro da pasta criada
New-Item -Path $caminhoImpl -ItemType Directory -Force

# Caminho completo para o arquivo use_case_impl.dart
$caminhoUseCaseImpl = Join-Path -Path $caminhoImpl -ChildPath "${pastaNome}_use_case_impl.dart"

# Criar o arquivo use_case_impl.dart com base no template
$useCaseImplTemplate | Set-Content -Path $caminhoUseCaseImpl

# Caminho completo para o arquivo use_case.dart
$caminhoUseCase = Join-Path -Path $caminhoPasta -ChildPath "${pastaNome}_use_case.dart"

# Criar o arquivo use_case.dart com base no template
$useCaseTemplate | Set-Content -Path $caminhoUseCase