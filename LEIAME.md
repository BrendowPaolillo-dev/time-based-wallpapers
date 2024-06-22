# time-based-wallpapers (Papéis de Parede Baseados no Tempo)
## Descrição
Um script PowerShell que muda automaticamente o papel de parede do seu desktop com base no horário do dia. Este script suporta vários monitores e permite uma personalização fácil dos caminhos dos papéis de parede e dos intervalos de tempo. Ideal para criar uma experiência de desktop dinâmica e personalizada.

## Como Executar o Script e Adicionar ao Agendador de Tarefas do Windows

Este guia irá orientá-lo pelos passos necessários para executar o script corretamente e adicioná-lo ao Agendador de Tarefas do Windows para automatizar a troca de papéis de parede com base no horário do dia.

### Pré-requisitos

1. **Windows PowerShell**: Verifique se o Windows PowerShell está instalado no seu sistema.
2. **Arquivo do Script**: Salve o script em um arquivo `.ps1`, por exemplo, `time_based_wallpapers.ps1`.

## Preparando o Script

Antes de executar o script `time_based_wallpapers.ps1`, você precisa personalizá-lo especificando os caminhos para suas imagens de papel de parede. Siga estas etapas para preparar o script:

1. **Localize Suas Imagens de Papel de Parede**

   - Certifique-se de ter as imagens de papel de parede salvas em um diretório no seu sistema. Por exemplo, suponha que suas imagens estejam em `C:\Users\username\images\wallpapers`. Anote este caminho do diretório.

2. **Edite o Script**

   - Abra o arquivo do script `time_based_wallpapers.ps1` em um editor de texto como Notepad ou Visual Studio Code. Você precisará modificar o script para apontar para suas imagens de papel de parede específicas.

3. **Atualize os Caminhos das Imagens**

   - Encontre a seguinte seção no script e substitua os caminhos:

```powershell
$morning = "C:\Users\username\images\wallpapers\1.jpeg"
$afternoon = "C:\Users\username\images\wallpapers\2.jpeg"
$evening = "C:\Users\username\images\wallpapers\3.jpeg"
$night = "C:\Users\username\images\wallpapers\4.jpeg"
```

## Passos para Executar o Script

1. **Abra o PowerShell como Administrador**:
   - Pressione `Windows + X` e selecione `Windows PowerShell (Admin)` ou `Terminal (Admin)`.

2. **Defina a Política de Execução**:
   - Na janela do PowerShell, defina a política de execução para permitir a execução de scripts. Execute o seguinte comando:
     ```powershell
     Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
     ```
   - Quando solicitado, digite `Y` e pressione `Enter`.

3. **Teste o Script**:
   - Navegue até o diretório onde seu script está salvo usando o comando `cd`. Por exemplo:
     ```powershell
     cd C:\Users\seu_caminho_para_o_script\
     ```
   - Execute o script:
     ```powershell
     .\time_based_wallpapers.ps1
     ```
   - Verifique se o papel de parede muda de acordo com o horário atual.

### Adicionando o Script ao Agendador de Tarefas do Windows

1. **Abra o Agendador de Tarefas**:
   - Pressione `Windows + S`, digite `Agendador de Tarefas` e pressione `Enter`.

2. **Crie uma Nova Tarefa**:
   - No Agendador de Tarefas, clique em `Criar Tarefa` no painel `Ações`.

3. **Configurações Gerais**:
   - Nomeie a tarefa, por exemplo, `Trocar Papel de Parede com Base no Tempo`.
   - Selecione `Executar apenas quando o usuário estiver conectado`.

4. **Configurações de Disparo**:
   - Vá para a guia `Disparadores` e clique em `Novo`.
   - Configure a tarefa para iniciar `Ao inicializar` e repetir a cada hora (ou o intervalo preferido). Por exemplo:
     - Inicie a tarefa: `Ao inicializar`
     - Repita a tarefa a cada: `1 hora`
     - Por um período de: `Indefinidamente`
     - Marque: `Habilitado`
     - Clique em `OK`.

5. **Configurações de Ação**:
   - Vá para a guia `Ações` e clique em `Novo`.
   - Configure `Ação` para `Iniciar um programa`.
   - No campo `Programa/script`, insira `powershell`.
   - No campo `Adicionar argumentos (opcionais)`, insira o seguinte, substituindo o caminho pelo local do seu script:
     ```powershell
     -NonInteractive -WindowStyle Hidden -File C:\Users\seu_caminho_para_o_script\time_based_wallpapers.ps1
     ```
   - Clique em `OK`.

6. **Condições e Configurações**:
   - Ajuste outras configurações ou condições conforme necessário nas guias `Condições` e `Configurações`.

7. **Salve a Tarefa**:
   - Clique em `OK` para salvar a tarefa.
   - Você pode ser solicitado a inserir sua senha para criar a tarefa.

8. **Inicie a Tarefa**:
   - Reinicie seu PC ou faça logoff e logon novamente para garantir que a tarefa seja iniciada conforme o esperado.

### Conclusão

Seu script está agora configurado para ser executado automaticamente nos intervalos especificados, garantindo que seu papel de parede mude de acordo com o horário do dia. Você pode modificar o script ou as configurações da tarefa a qualquer momento, se necessário.
