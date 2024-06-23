# time-based-wallpapers (Papéis de Parede Baseados no Tempo)
***Documentation in English:*** [README.md](https://github.com/BrendowPaolillo-dev/time-based-wallpapers/blob/main/README.md)

## Descrição
Um script PowerShell que muda automaticamente o papel de parede do seu desktop com base na hora do dia. Este script suporta múltiplos monitores e permite fácil personalização dos caminhos dos papéis de parede e intervalos de tempo. Ideal para criar uma experiência de desktop dinâmica e personalizada. O script seleciona um papel de parede aleatório de diretórios especificados com base na hora do dia.

## Como Executar o Script e Adicioná-lo ao Agendador de Tarefas do Windows

Este guia irá orientá-lo através das etapas necessárias para executar o script corretamente e adicioná-lo ao Agendador de Tarefas do Windows para automatizar as mudanças de papel de parede com base na hora do dia.

### Pré-requisitos

1. **Windows PowerShell**: Certifique-se de que o Windows PowerShell está instalado no seu sistema.
2. **Arquivo de Script**: Salve o script em um arquivo `.ps1`, por exemplo, `time_based_wallpapers.ps1`.

## Preparando o Script

Antes de executar o script `time_based_wallpapers.ps1`, você precisa personalizá-lo especificando os caminhos para os diretórios de imagens de papel de parede. Siga estas etapas para preparar o script:

1. **Localize Suas Imagens de Papel de Parede**

   - Certifique-se de que você tem as imagens de papel de parede salvas em diretórios no seu sistema. Por exemplo, vamos supor que suas imagens estão localizadas em `C:\Users\username\images\wallpapers\morning`, `C:\Users\username\images\wallpapers\afternoon`, `C:\Users\username\images\wallpapers\evening` e `C:\Users\username\images\wallpapers\night`. Anote esses caminhos de diretório.

2. **Edite o Script**

   - Abra o arquivo de script `time_based_wallpapers.ps1` em um editor de texto como Notepad ou Visual Studio Code. Você precisará modificar o script para apontar para seus diretórios específicos de papel de parede.

3. **Atualize os Caminhos das Imagens**

   - Encontre a seguinte seção no script, substitua os caminhos e salve o script:

```powershell
$morningDir = "C:\Users\username\images\wallpapers\morning"
$afternoonDir = "C:\Users\username\images\wallpapers\afternoon"
$eveningDir = "C:\Users\username\images\wallpapers\evening"
$nightDir = "C:\Users\username\images\wallpapers\night"
```

## Passos para Executar o Script

1. **Arquivo de Lote (.bat)**:
   - Altere o arquivo de lote chamado `run.bat`:

     ```batch
     powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Users\seu_caminho_para_o_script\time_based_wallpapers.ps1"
     ```

2. **Arquivo VBS (Windows Script Host)**:
   - Altere o arquivo VBS chamado `run.vbs`:

     ```vbscript
     Set objShell = CreateObject("WScript.Shell")
     objShell.Run "C:\Users\seu_caminho_para_o_script\run.bat", 0, False
     ```

3. **Abra o PowerShell como Administrador**:
   - Pressione `Windows + X` e selecione `Windows PowerShell (Admin)` ou `Terminal (Admin)`.

4. **Defina a Política de Execução**:
   - No PowerShell, defina a política de execução para permitir a execução de scripts. Execute o seguinte comando:
     ```powershell
     Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
     ```
   - Quando solicitado, digite `Y` e pressione `Enter`.

5. **Teste o Script**:
   - Navegue até o diretório onde seu script está salvo usando o comando `cd`. Por exemplo:
     ```powershell
     cd C:\Users\seu_caminho_para_o_script\
     ```
   - Execute o script:
     ```powershell
     .\run.vbs
     ```
   - Verifique se o papel de parede muda de acordo com a hora atual.

### Adicionando o Script ao Agendador de Tarefas do Windows

1. **Abra o Agendador de Tarefas**:
   - Pressione `Windows + S`, digite `Agendador de Tarefas` e pressione `Enter`.

2. **Crie uma Nova Tarefa**:
   - No Agendador de Tarefas, clique em `Criar Tarefa` no painel `Ações`.

3. **Configurações Gerais**:
   - Nomeie a tarefa, por exemplo, `Mudar Papel de Parede com Base no Tempo`.
   - Selecione `Executar apenas quando o usuário estiver conectado`.
   - Selecione `Executar com privilégios mais altos`.

4. **Configurações de Gatilho**:
   - Vá para a aba `Gatilhos` e clique em `Novo`.
   - Defina a tarefa para iniciar `No logon` e repetir a cada hora (ou o intervalo de sua preferência). Por exemplo:
     - Iniciar a tarefa: `No logon`
     - Repetir tarefa a cada: `1 hora`
     - Por uma duração de: `Indefinidamente`
     - Definir: `Habilitado`
     - Clique em `OK`.

5. **Configurações de Ação**:
   - Vá para a aba `Ações` e clique em `Novo`.
   - Defina `Ação` para `Iniciar um programa`.
   - No campo `Programa/script`, insira `wscript.exe`.
   - No campo `Adicionar argumentos (opcional)`, insira o caminho completo do arquivo `run.vbs`. Por exemplo:
     ```powershell
     "C:\Users\seu_caminho_para_o_script\run.vbs"
     ```
   - Clique em `OK`.

6. **Condições e Configurações**:
   - Ajuste quaisquer outras configurações ou condições conforme necessário nas abas `Condições` e `Configurações`.

7. **Salve a Tarefa**:
   - Clique em `OK` para salvar a tarefa.
   - Pode ser solicitado que você digite sua senha para criar a tarefa.

8. **Inicie a Tarefa**:
   - Reinicie seu PC ou faça logoff e login novamente para garantir que a tarefa inicie conforme esperado.

### Conclusão

Seu script agora está configurado para ser executado automaticamente nos intervalos especificados, garantindo que seu papel de parede mude com base na hora do dia. Você pode modificar o script ou as configurações da tarefa a qualquer momento, se ajustes forem necessários.